import ConfigUtils as Conf
import logging
import os
logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)

JSprompt='.*\$.*'
VAprompt='.*\#.*'

logging.info("Connecting to the Jump Server %s" % os.getenv('JS_IP'))
ssh=Conf.Connect(JS_IP=os.getenv('JS_IP'),JS_User=os.getenv('JS_User'))

#Step to Create New User 
logging.info("Create New User")
Conf.AcCreateUser(Handler=ssh,AC_IP=os.getenv('AC_IP'),AC_User='varmour',AC_Pass='vArmour123',AC_New_User=os.getenv('AC_New_User'),AC_New_Pass=os.getenv('AC_New_Pass'), Key=os.getenv('KeyFile'), Expect=JSprompt)

#Step to Modify the user - varmour
logging.info("Modify the Password of varmour")
Conf.AcUpdateUser(Handler=ssh,AC_IP=os.getenv('AC_IP'),AC_User='varmour',AC_Pass='vArmour123',AC_Def_New_Pass=os.getenv('AC_Def_New_Pass'), Key=os.getenv('KeyFile'), Expect=JSprompt)
 
