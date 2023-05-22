import os
import subprocess

def convert_batch_to_exe(batch_file_path):
    # Get the directory and filename of the batch file
    batch_dir = os.path.dirname(batch_file_path)
    batch_filename = os.path.basename(batch_file_path)

    # Change the working directory to the batch file's directory
    os.chdir(batch_dir)

    # Create the command to convert the batch file to an EXE file using PyInstaller
    command = f'pyinstaller --onefile {batch_filename}'

    # Execute the command using subprocess
    subprocess.call(command, shell=True)

if __name__ == '__main__':
    batch_file_path = r'C:\Users\Student\Documents\GitHub\HIDE-ACTIVATION-BANNER\activation.bat'
    convert_batch_to_exe(batch_file_path)
