# Submission Reminder App

This Submission Reminder App is a Bash-based application designed to help students keep track of their pending assignment submissions. The app reads assignment data from a CSV file and displays a reminder for each student who has not yet submitted the assignment.

## Directory Structure

When you run the environment setup script (`create_environment.sh`), it creates the following structure:

- app/reminder.sh: Sources the required files and checks submissions file.
- assets/submissions.txt: Contains student records in CSV format with three columns: `Student`, `Assignment`, and `Submission Status`.
- config/config.env: Holds configuration variables such as the assignment name and the number of days remaining.
- modules/functions.sh: Contains helper functions used by the app (including the `check_submissions` function).
- startup.sh: The main script that starts the application.

## How the App Works

1. Setup:
   - Run the `create_environment.sh` script to create the directory structure and necessary files.

2. Configuration:
   - The file `config/config.env` stores general settings. For example:
     ```bash
     # config.env - Configuration file for submission reminder app
     ASSIGNMENT="Shell Navigation"
     DAYS_REMAINING=2
     ```
   - These variables are used to determine which assignment to check and how many days are left until submission is due.

3. Submissions Data:
   - The `assets/submissions.txt` file holds the submission records. It should have the following format:
     ```
     Student,Assignment,Submission Status
     alice,Shell Navigation,submitted
     bob,Shell Navigation,not submitted
     charlie,File Permissions,submitted
     ```
   - Each row represents a student’s submission status for a specific assignment.

4. Running the Application:
   - When you run `startup.sh`, the app will:
     - Source the configuration and helper function files.
     - Prompt you to enter your username.
     - Display the assignment details (name and days remaining).
     - Read through `submissions.txt` and check for records where:
       - The student matches the username you entered.
       - The assignment matches the one specified in `config.env`.
       - The submission status is `"not submitted"`.
     - If these conditions are met, the app outputs a reminder message.

5. Usage Example:
   - Upon running the app:
     ```bash
     ./startup.sh
     ```
   - You might see:
     ```
     Enter your username: bob
     Assignment: Shell Navigation
     Days remaining to submit: 2 days
     --------------------------------------------
     Reminder: bob has not submitted the Shell Navigation assignment!
     ```

## How to Run the App

1. Set Up the Environment:
   - Make the setup script executable and run it:
     ```bash
     chmod +x create_environment.sh
     ./create_environment.sh
     ```
   - This creates the `submission_reminder_<yourName>` directory with all the necessary files.

2. Start the Application:
   - Navigate into the created directory:
     ```bash
     cd submission_reminder_<yourName>
     ```
   - Make the startup script executable (if not already):
     ```bash
     chmod +x startup.sh
     ```
   - Run the application:
     ```bash
     ./startup.sh
     ```

3. Follow the Prompts:
   - Enter your username when prompted to see your pending submissions.

## Requirements

- Bash Shell:
  The application requires Bash (preferably version 4.0 or later).
- Standard Unix Utilities: 
  The scripts use standard Unix commands such as `cat`, `xargs`, and `tail`.

## License

This project is open source and available under the [MIT License](LICENSE).

---

Feel free to modify this README and the app scripts as needed to better suit your requirements. Enjoy using the Submission Reminder App!


