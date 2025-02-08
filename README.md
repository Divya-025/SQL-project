## Employee attendance system


### Description:

    Creating an Employee Attendance System using MySQL involves building a database structure that stores and manages employee attendance data. The system will store information about employees, their attendance, working hours, and any other related details.
    
    
### Database Schema:

  
 The Database consists of the following tables:
  ### 1.Employees:
                 Stores employee's details (ID , name , location , shift)
  ### 2.Attendancerecords :
                 Stores employee's ID , day  in time and day out time.
  ### 3.Department :
                Stores employee's department with their ID.
  ### SQL features used:
    JOINS:
             Used to retrieve detailed information about employee's working hours using joins
    Views :
             Created employeedetails view to know number of employees present in each department
    Stored procedures :
             Created a stored procedure to retrieve employees present or not
