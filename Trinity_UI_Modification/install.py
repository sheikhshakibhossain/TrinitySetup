#   ___         _ ___            ___ ___ _   _ ___     _   _
#  |   \ ___ __| / __| ___ __   / __| _ \ | | | _ )___| |_| |_  ___ _ __  ___
#  | |) / -_) _` \__ \/ -_) _| | (_ |   / |_| | _ \___|  _| ' \/ -_) '  \/ -_)
#  |___/\___\__,_|___/\___\__|  \___|_|_\\___/|___/    \__|_||_\___|_|_|_\___|
#
# Version: 3.0
#
# Written by Vandal (vandalsoul)
# Github: https://github.com/vandalsoul/dedsec-grub2-theme/


import subprocess
import os
import re


def check_root():
    id = int(subprocess.check_output("id -u", shell=True).decode("utf-8"))
    if id != 0:
        print("(!) Run the script with 'sudo' privileges or as root user !!\n")
        exit()


def change_grub_theme(grub_theme_path):

    output = str(subprocess.check_output("cat /etc/*-release", shell=True).decode("utf-8"))
    id = re.search(".*[a-zA-Z]+=[a-zA-Z]+", output).group(0)
    distro = id.replace("ID=","").lower().strip()

    with open("/etc/default/grub", "r") as grub_file:
        data = grub_file.readlines()
        flag = False
        for i, line in enumerate(data):

            if (distro in ["fedora","redhat"]) and (line.startswith("GRUB_TERMINAL_OUTPUT")):
                data.pop(i)
                data.insert(i, f'#{line}\n')

            elif line.startswith("GRUB_THEME"):
                flag = True
                data.pop(i)
                data.insert(i, f'GRUB_THEME="{grub_theme_path}"\n')
				
        if not flag:
            data.append(f'GRUB_THEME="{grub_theme_path}"\n')

    with open("/etc/default/grub", "w") as grub_file:
        grub_file.writelines(data)


def main():
    print(
        r"""
    ___         _ ___            ___ ___ _   _ ___     _   _                  
    |   \ ___ __| / __| ___ __   / __| _ \ | | | _ )___| |_| |_  ___ _ __  ___ 
    | |) / -_) _` \__ \/ -_) _| | (_ |   / |_| | _ \___|  _| ' \/ -_) '  \/ -_)
    |___/\___\__,_|___/\___\__|  \___|_|_\\___/|___/    \__|_||_\___|_|_|_\___|

    Written by Vandal (vandalsoul)
    Github: https://github.com/vandalsoul/dedsec-grub2-theme/                                                                   
    """
    )
    print("\n( DEDSEC GRUB-THEME INSTALLER )\n")
    check_root()

    THEME_DIR = "dedsec/"

    if os.path.exists("/boot/grub/"):

        GRUB_THEMES_DIR = "/boot/grub/themes/"
        GRUB_UPDATE_CMD = "grub-mkconfig -o /boot/grub/grub.cfg"
		
        if not os.path.exists(GRUB_THEMES_DIR):
            os.mkdir(GRUB_THEMES_DIR)

    elif os.path.exists("/boot/grub2/"):

        GRUB_THEMES_DIR = "/boot/grub2/themes/"
        GRUB_UPDATE_CMD = "grub2-mkconfig -o /boot/grub2/grub.cfg"
		
        if not os.path.exists(GRUB_THEMES_DIR):
            os.mkdir(GRUB_THEMES_DIR)

    else:
        print("\n(!) Couldn't find the GRUB directory. Exiting the script ...")
        exit()

    print("\n($) Copying the theme directory ...")
    subprocess.run(f"cp -r {THEME_DIR} {GRUB_THEMES_DIR}", shell=True)

    print("\n($) Editing the GRUB file ...")
    THEME_FILE_PATH = f"{GRUB_THEMES_DIR}{THEME_DIR}theme.txt"
    change_grub_theme(THEME_FILE_PATH)

    print("\n($) Updating GRUB ...\n")
    subprocess.run(GRUB_UPDATE_CMD, shell=True)

    print("\n($) Dark Matter GRUB theme was Successfully Installed !!\n")
    exit()


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print("\n(!) An unexpected error occured while running the script. Installation was unsuccessful ...\n")
        print(f"(!) ERROR: {e}")
        exit()
