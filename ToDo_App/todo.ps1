############################################################################################################
# Author: Attila Fánczi                                                                                    #
# Date: 01.25.2021                                                                                         #
# Project name: ToDoApp                                                                                    #
# Version: 1.0.2                                                                                           #
# Description: It collects and displays the current daily tasks in a txt file when the machine is started. #
############################################################################################################

Clear-Host

# Date save to a variable

$Date = Get-Date -Format "yyyy-MM-dd"

# Checking the path of application work directory

if (Test-Path *ToDo_notepad_destination_path*) {
    $List = Get-Content *ToDo_notepad_destination_path*
    $DateTest = $List | Select-String $Date

    if (!(Test-Path *Destination_path_of_task_list_for_todo_app*)) {
        Copy-Item -Path "*Safety_dectination_path_of_task_list_for_todo_app*" -Destination "*Destination_path_of_ToDo_notepad_directory*"
    }

    $TextList = Get-Content *Destination_path_of_task_list_for_todo_app* 
    $DalyList = $TextList | Select-String $Date
    $Dalyroutinelist = $DalyList -split "$Date"

    # File control commands organized into functions, thus avoiding a multitude of redundant data
    function content_directed_to_a_file {
        Write-Output "_________________________________" >> *ToDo_notepad_destination_path*
        Write-Output "Hi BOSS! What are we doing today?" >> *ToDo_notepad_destination_path*
        Write-Output " "
        Write-Output " "
        Write-Output $Dalyroutinelist >> *ToDo_notepad_destination_path*
    }
    function content_directed_to_a_file_with_date {
        $Date > *ToDo_notepad_destination_path*
        content_directed_to_a_file
    }
    function content_directed_to_a_logfile {
        Get-Content *ToDo_notepad_destination_path* >> *Destination_path_of_ToDo_app_log_file*
        Write-Output "_________________________________" >> *Destination_path_of_ToDo_app_log_file*
    }

    # In case of a date match, the data will be displayed / overwritten / with this possible extension, which also applies to the same day

    if ($DateTest -eq $Date) {
        content_directed_to_a_file_with_date
    }
    else {

        # If the directory exists but the content date entry does not match the current date
        # then creates a \LOG directory and saves (archives) the previous day's data

        if (Test-Path *ToDo_log_directory_path* ) {
            content_directed_to_a_logfile
            content_directed_to_a_file_with_date
        }
        else {
            mkdir *ToDo_log_directory_path* 
            Start-Process "G:\Startup_Apps\todo.ps1"
            break
        }
    }
}
else {

    # If the directory does not exist, it creates the path and then loads the daily content

    if (Test-Path *Destination_path_of_ToDo_notepad_directory*) {
        if (!(Test-Path *Destination_path_of_task_list_for_todo_app*)) {
            Copy-Item -Path "*Safety_dectination_path_of_task_list_for_todo_app*" -Destination "*Destination_path_of_ToDo_notepad_directory*"
        }
        if (!(Test-Path *ToDo_notepad_destination_path*)) {
            New-Item -Path "*Destination_path_of_ToDo_notepad_directory*" -Name "ToDo.txt" -ItemType "file"
            $Date > *ToDo_notepad_destination_path* 
            Start-Process "*Destination path where you put todo.ps1 file*"
            break
        }
    }
    else {

        New-Item -Path "$HOME" -Name "TODO" -ItemType "directory"
        New-Item -Path "*Destination_path_of_ToDo_notepad_directory*" -Name "ToDo.txt" -ItemType "file"
        Copy-Item -Path "*Safety_dectination_path_of_task_list_for_todo_app*" -Destination "*Destination_path_of_ToDo_notepad_directory*"
        $Date > *ToDo_notepad_destination_path* 
        Start-Process "*Destination path where you put todo.ps1 file*"
        break
    }
}

# Path save to a variable

$todoList = *ToDo_notepad_destination_path*

# Open ToDo.txt 

Write-Output $todoList