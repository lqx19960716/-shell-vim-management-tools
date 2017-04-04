# -shell-vim-management-tools
用于添加并切换vim配置文件，使用前务必转移到用户根目录“～”。  
文件介绍：  
addvim.sh:用于添加当前的配置文件到备份目录exvim中或删除某一备份文件;  
chvim.sh：用于改变当前备份文件。  
使用方法：  
1）使用前先初始化并备份当前文件作为源模式，假定命名为0，键入：./addvim 0;  
2）改变配置文件后，若想要保留，则键入：./addvim <modename>，其中名字自定义;  
3）若想要删除某一配置备份，键入：./addvim -r <modename>，务必先确认是否存在;  
4）想要切换到某一模式时，键入：./chvim <modename>即可。
