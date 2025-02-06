# bin
Bin files/scripts

These are the convenience tools I use, typically in WSL/Ubuntu (some are WSL-specific).

## Install

Assumes there isn't already a folder/file at `~/bin`.
Clone at `~`, re-proccess `~/.profile` (because typically, .profile will add `~/bin` to the path, if it exists).

```bash
 cd ~
 clone git@github.com:happiness801/bin.git
 . ~/.profile
```

## Other Useful scripts:

1. git@github.com:gdiepen/docker-convenience-scripts.git

## copy-bing-wallpaper.ps1

Got this one from Bing Chat:

Create the PowerShell Script:

Open Notepad or any text editor.

Copy and paste the following code: (see script)

Save the Script:

Save the file with a .ps1 extension, for example, update-wallpaper.ps1.

Create a Task in Task Scheduler:

Press Win + R, type taskschd.msc, and press Enter to open Task Scheduler.

Click on "Create Task" in the Actions pane.

In the "General" tab, give the task a name like "Update Wallpaper."

In the "Triggers" tab, click "New..." and set the trigger to "At log on."

In the "Actions" tab, click "New...", set the action to "Start a program," and browse to the PowerShell executable, usually located at C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe.

In the "Add arguments (optional)" field, enter the path to your PowerShell script, e.g., -File "C:\path\to\update-wallpaper.ps1".

Set the Static Wallpaper Path in Your Wife’s Profile:

Log into your wife's profile.

Right-click on the desktop, select "Personalize," and go to the “Background” section.

Choose "Picture" as the background type.

Click "Browse" and navigate to `C:\Users\[WifesUsername]\Pictures\background.jpg`.

Select the image and apply it.

Now, every time you log in, the script will copy the latest Bing Wallpaper image to your wife's profile, and her wallpaper will be automatically updated.
