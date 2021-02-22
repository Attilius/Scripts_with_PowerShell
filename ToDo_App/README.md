# Description:

​	With this application, daily tasks can be displayed in a notepad.

# Settings:

## 	Set the paths required for the app to work.

​	<u>These routes are:</u>

- ​	`ToDo_notepad_destination_path`

- ​	`Destination_path_of_task_list_for_todo_app`

- ​	`Safety_dectination_path_of_task_list_for_todo_app`

- ​	`Destination_path_of_ToDo_notepad_directory`

- ​	`ToDo_log_directory_path`

- ​	`Destination_path_of_ToDo_app_log_file`

  

  ### **These routes must be set in the code!!!**

  TIP: You can use your home profile for work directory of this app

  Example: `ToDo_notepad_destination_path` 

  ```powershell
  $HOME\Todo\todo.txt
  ```

## Set this application to start with your windows!!!

Must be create a startup.cmd file witch contain this:

```powershell
PowerShell "Destination path where you put todo.ps1 file"
```

Use WIN+R hot key and put startup.cmd into startup folder.

Enjoy it! :)