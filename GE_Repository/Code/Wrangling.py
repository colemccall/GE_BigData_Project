import pandas as pd


def cleanDataFrame(dataframe):
    student_ids = []            #index=1
    submission_dates = []       #index=6
    learning_outcome_codes = []  #index=7
    learning_outcome_years = []
    course_names =[]            #index=14
    semesters = []
    course_sis_ids = []         #index=16
    section_names = []          #index=17
    learning_outcome_rating = []#index=25
    learning_outcome_points = []#index=26
    adjusted_learning_outcomes = []
    final_outcome_info = []
    assignments = []
    college = []
    compliance = []

    ## Read data from the dataframe
    ## For some columns, the information will be manipulated
    for index, rows in dataframe.iterrows():
        student_ids.append(rows[2])
        assignments.append(rows[5])

        ## Manipulate the date, so that we only get YYYY-MM-DD
        submission_dates.append(str(rows[7]).split('T')[0])

        ## Manipulate the learning outcome name, seperating into code and year
        learning_outcome_name = str(rows[9]).split('_')
        if(len(learning_outcome_name) > 2):
            if(learning_outcome_name[0] == 'GE'):
                learning_outcome_years.append(learning_outcome_name[2].split(' ')[0])
                learning_outcome_codes.append(learning_outcome_name[1])
            else:
                learning_outcome_codes.append('Not a GE outcome')
                print(rows[16])

        else:
            learning_outcome_codes.append('Invalid outcome')
            learning_outcome_years.append('NaN')
            


        ## Original method, but just duplicates the same information 3 times
        #course_names.append(rows[14])
        course_sis_ids.append(rows[17])
        #section_names.append(rows[17])


        ## Slice the course code into 3 pieces of information: semester, course code, section code
        course_id = rows[17].split(' ')[-1].split('_')
        semesters.append(course_id[0])
        course_names.append(course_id[1])
        section_names.append(course_id[2])
        

        # Manipulate the rating, getting rid of everything except for the actual value
        outcome_rating = str(rows[26]).split(':')[0]
        learning_outcome_rating.append(outcome_rating)
        #print(outcome_rating)
        
         
        # Leave points as is, maybe convert to int
        outcome_points = (rows[27])
        learning_outcome_points.append(outcome_points)
        #print(outcome_points)


        # Calculate an adjusted learning outcome score
        if outcome_points > 0 and outcome_points <= 3.0:
            adjusted_learning_outcomes.append(outcome_points)
        elif outcome_points > 3.0 and outcome_points <= 5.0:
            adjusted_learning_outcomes.append(-1)
        else:
            if(outcome_rating == 'Exemplary'):
                adjusted_learning_outcomes.append(3.0)
            elif (outcome_rating == 'Target'):
                adjusted_learning_outcomes.append(2.0)
            elif(outcome_rating == 'Minimum'):
                adjusted_learning_outcomes.append(1.0)
            elif (outcome_rating == 'Outcome Not Met' or outcome_rating == 'Outcome not met.'):
                adjusted_learning_outcomes.append(0.0)
            else:
                adjusted_learning_outcomes.append(-2.0)


        # Based on the outcome score, provide an actual rating
        if(adjusted_learning_outcomes[index] == 3.0):
            final_outcome_info.append('Exemplary')
        elif(adjusted_learning_outcomes[index] == 2.0):
            final_outcome_info.append('Target')
        elif(adjusted_learning_outcomes[index] == 1.0):
            final_outcome_info.append('Minimum')
        elif(adjusted_learning_outcomes[index] == 0.0):
                final_outcome_info.append('Fail')
        elif(adjusted_learning_outcomes[index] == -2):
            final_outcome_info.append('No Data Collected')
        elif(adjusted_learning_outcomes[index] == -1):
            final_outcome_info.append('Invalid Entry - Distinguished/Commendable')
        else:
            final_outcome_info.append('Unknown Error')


        ## Add in college code
        theology = ['THEO', 'BIBL', 'PHIL', 'PRTH']
        nat_sci = ['COMP', 'BIOL', 'CHEM', 'ENGR', 'PHYS', 'KINE', 'MILS']
        art_hum = ['CLTA', 'COMM' , 'HUMN', 'ARDE', 'MUSC', 'ENGL', 'GEOG', 'POLS', 'HIST' , 'FREN', 'SPAN']
        business = ['ECON', 'BSNS']
        behav_social = ['PSYC', 'SOWK', 'CRIM']
        education = ['EDUC']
        nursing = ['NURS']

        course_code = course_names[index][0:4]
        if(course_code in theology):
            college.append('College of Theology & Christian Ministry')
        elif(course_code in nat_sci):
            college.append('College of Natural and Applied Sciences')
        elif(course_code in art_hum or course_code == 'HNRS' or course_code == 'INTD'):
            college.append('College of Arts and Humanites')
        elif(course_code in business):
            college.append('College of Business')
        elif(course_code in behav_social):
            college.append('College of Behavior and Social Sciences')
        elif(course_code in education):
            college.append('College of Educaton')
        elif(course_code in nursing):
            college.append('College of Nursing')
        else:
            college.append('We dont know')

        ## Based on outcome ratings, lets add outcome score
        if (adjusted_learning_outcomes[index] == 3 or adjusted_learning_outcomes[index] == 2 
        or adjusted_learning_outcomes[index] == 1 or adjusted_learning_outcomes[index] == 0):
            compliance.append('Outcome assessed')
        elif (adjusted_learning_outcomes[index] == -2):
            compliance.append('Outcome attached - no assessment')
        elif (adjusted_learning_outcomes[index] == -1):
            compliance.append('Outcome attached - invalid assessment')
        else:
            compliance.append('Outcome not attached')

    new_frame = pd.DataFrame(list(zip(submission_dates, assignments, learning_outcome_codes, learning_outcome_years, course_sis_ids, semesters, course_names, section_names, learning_outcome_rating, learning_outcome_points, adjusted_learning_outcomes, final_outcome_info, college, compliance))
    ,index = student_ids, columns=('submission_date', 'assignment', 'outcome code', 'outcome year', 'course_id', 'semester', 'course', 'section', 'outcome rating', 'outcome score', 'corrected outcome score', 'corrected outcome rating', 'college' , 'compliance'))

    clean_frame = pd.DataFrame(list(zip(submission_dates, assignments, learning_outcome_codes, learning_outcome_years, course_sis_ids,semesters, course_names, section_names, adjusted_learning_outcomes, final_outcome_info, college, compliance))
    ,index = student_ids, columns=('submission_date', 'assignment code', 'outcome code', 'outcome year', 'course_id', 'semester', 'course', 'section', 'outcome score', 'outcome rating', 'college', 'compliance'))


    return new_frame, clean_frame





def loadDataFrame(datapath):
    data = pd.read_csv(datapath)
    return pd.DataFrame(data)




def combineCanvas():
    import os, pandas as pd

    ## Set the canvas landing path
    #canvas_path = os.getcwd() + '\\1_Landing\\Canvas'
    canvas_path = 'C:\\Users\\colem\\Desktop\\Senior\\BigData\\GE_BigData_Project\\General_Ed_Outcomes\\1_Landing\\Canvas'
    canvas_files = os.listdir(canvas_path)

    frames = []

    ## Create a dataframe for each file in the canvas landing path
    for name in canvas_files:
        file_path = (canvas_path + '\\' + name)
        df = pd.read_csv(file_path)
        frames.append(df)


    ## Combine dataframes from each semester and show it
    result = pd.concat(frames)
    semester_canvas_data_path = 'C:\\Users\\colem\\Desktop\\Senior\\BigData\\GE_BigData_Project\\General_Ed_Outcomes\\2_Staging\\Combined\\All_Semesters_Canvas.csv'
    result.to_csv(semester_canvas_data_path)
    return semester_canvas_data_path





def combineRegistrar():
    import os, pandas as pd

    ## Set the canvas registrar path
    registrar_path = 'C:\\Users\\colem\\Desktop\\Senior\\BigData\\GE_BigData_Project\\GE_Repository\\Data\\Landing\\Registrar'
    registrar_files = os.listdir(registrar_path)

    frames = []

    ## Create a dataframe for each file in the canvas landing path
    for name in registrar_files:
        file_path = (registrar_path + '\\' + name)
        df = pd.read_csv(file_path)
        frames.append(df)


    ## Combine dataframes from each semester and show it
    result = pd.concat(frames)
    semester_registrar_data_path = 'C:\\Users\\colem\\Desktop\\Senior\\BigData\\GE_BigData_Project\\GE_Repository\\Data\\Staging\\Combined\\All_Semesters_Registrar.csv'
    result.to_csv(semester_registrar_data_path)
    



