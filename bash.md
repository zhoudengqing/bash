# bash脚本编程

## shell 执行

- bash name.sh
- ./name.sh
- source name.sh
- . ./name.sh 和source功能相同

## 特殊字符

- ‘#’ 注释 #！是个例外
- ‘;’ 命令分割符 可以在同一行写两个或两个以上的命令
- ‘.’ 点命令 等价于source,bash内建命令，也可作为正则表达式的一部分匹配单个字符
- ‘;;’ 终止case选项[双分号]
- ‘ " ’ 双引号，部分引用
- ‘ ' ’ 单引号，全引用
- ‘ ，’ 逗号操作符
- ‘\’ 转义符
- ‘/’ 文件名路径分隔符
- ‘ ` ’ 命令替换，`command`结构可以将命令的输出赋值到一个变量中
- ‘ ：’ 空命令 提供一个占位符，: ${username=`whoami`}如果没有开头的：号的话，将给出一个错误
- ‘ ！’ 取反操作符
- ‘ * ’ 通配符，匹配任何文件名
- ‘ * ’ 算术操作符，乘法运算
- ‘ ** ’ 求幂操作符
- ‘ ？’ 测试操作符，表达式中测试一个条件的结果
- ‘ ？’ 通配符，匹配单个字符，在正则表达式中也是表示一个字符
- ‘ $ ’ 变量替换(引用变量的内容)
- ‘ $ ’ 行结束符,在正则表达式中表示行结束符
- ${} 参数替换
- "$*" 所有的位置参数(作为单个字符串)
- ‘ $@ ’ 所有的位置参数(每个都作为独立的字符串)
- ‘ $* ’ 等同于$@
- ‘ $? ’ 退出状态码变量
- ‘ $$ ’ 进程ID变量
- ‘ () ’ 命令组，在括号中的命令列表，将作为一个子shell来运行
- ‘ {} ’ 代码块大括号
- ‘ {} \; ’ 路径名，在find命令中使用，‘;’用来结束find命令序列的-exec选项，防止被shell所解释
- ‘ [] ’ 条件测试,条件测试表达式放在[]中
- ‘ [[]] ’ 测试,表达式放在[[]]中
- ‘ [] ’ 数组元素 用来引用数组中的每个元素的编号
- ‘ [] ’ 字符范围,用在正则表达式中，描述一个匹配的字符范围
- ‘ (()) ’ 整数扩展 扩展并计算(())中的整数表达式
- ‘ | ’ 管道，分析前边命令的输出，并将输出作为后边命令的输入
- ‘ >| ’ 强制重定向，强制的覆盖一个现存的文件
- ‘ || ’ 或逻辑操作
- ‘ & ’ 后台运行命令
- ‘ && ’ 与-逻辑操作
- ‘ + - * / % += -= *= /= %= ’ 算术操作符
- ' << ' 左移一位
- ' <<= ' 左移-赋值
- ' >> ' 右移一位
- ' >>= ' 右移-赋值
- ' & ' 按位与
- ' &= ' 按位与-赋值
- ' | ' 按位或
- ' |= ' 按位或-赋值
- ' ~ ' 按位反
- ' ^ ' 按位异或
- ' ^= ' 按位异或-赋值
- ‘ = ’ 赋值操作 算术等号和字符串比较
- ‘ $0 ’ 脚本名称
- ‘ $1-$9 ’ 脚本执行时输入的第1个至第9个参数
- ‘ $1_ ’ 如果这个参数不存在将以额外字符替代，防止给参数赋null变量产生错误
- ‘ $# ’ 输入的参数个数
- ‘ \n ’ 表示新的一行
- ‘ \r ’ 表示回车
- ‘ \t ’ 表示水平制表符
- ‘ \v ’ 表示垂直制表符
- ‘ \b ’ 表示后退符
- ‘ \a ’ 蜂鸣或者闪烁
- ‘ \0xx ’ 转换为八进制的ASCII码
- ‘ \" ’ 表示引号
- ‘ \$ ’ 表示$本身
- ‘ \\ ’ 表示反斜线

## 环境变量配置文件

- /etc/profile 通用配置
- /etc/profile.d
- ~/.bash_profile
- ~/.bashrc
- /etc/bashrc

## 变量和参数

- 指定变量类型
    1. declare/typeset
    2. -r 只读
    3. -i 整型
    4. -a 数组
    5. -f 函数
    6. -x export
- 局部变量
    1. local valnum
    2. 数组变量 IP=(10.0.0.1 10.0.0.2 10.0.0.3) 访问 ${IP[0]}
    3. shift 命令会重新分配位置参数, 把所有的位置参数都向左移动一个位置

## 内部变量

- $BASH bash的二进制程序文件的路径
- $FUNCNAME 当前函数的名字
- $GROUPS 目前用户所属的组
- $HOME 用户的home目录
- $IFS 内部域分隔符
- ￥PATH 可执行文件的搜索路径
- $PS1  主提示符
- $PS2  第二提示符
- $PS3  第三提示符
- $PWD 工作目录
- $REPLY 当没有参数变量提供给read命令的时候，这个变量会作为默认变量提供给read命令
- ￥UID 用户ID
- $! 运行在后台的最后一个作业的PID
- $_ 这个变量保存之前执行的命令的最后一个参数的值

## 字符串操作

- ${#string} 计算字符串长度
- expr length $string 计算字符串长度
- expr "$string" : '.*' 计算字符串长度
- expr match "$string" '$substring' 匹配字符串开头的子串长度
- expr "$string" : '$substring' 匹配字符串开头的子串长度
- expr index $string $substring 在字符串string中匹配到的substring第一次出现的位置
- ${string:position} 提取子串,在string中从位置position开始提取子串 
- ${string:position:length} 在string中从位置position开始提取length长度的子串
- expr substr $string $position $length 在string中从position开始提取length长度的子串
- 子串替换 ${string/substring/replacement} 使用replacement来替换第一个匹配的substring
- ${string//substring/replacement} 使用replacement来替换所有匹配的substring
- ${string/#substring/replacement} 如果substring匹配string的开头部分, 那么就用replacement来替换substring
- ${string/%substring/replacement} 如果substring匹配string的结尾部分, 那么就用replacement来替换substring
- ${parameter-default} 如果变量parameter没被声明, 那么就使用默认值
- ${parameter:-default} 如果变量parameter没被设置, 那么就使用默认值
- ${parameter=default} 如果变量parameter没声明, 那么就把它的值设为default
- ${parameter:=default} 如果变量parameter没设置, 那么就把它的值设为default
- ${parameter?err_msg} 如果parameter已经被声明, 那么就使用设置的值, 否则打印err_msg错误消息
- ${parameter:?err_msg} 如果parameter已经被设置, 那么就使用设置的值, 否则打印
err_msg错误消息

## 条件判断

- 条件测试
    if []
    then
      command
    else
      command
    fi

    if []
    then
     command
    elif []
    then
        command
    else
        command
    fi

使用[[ ... ]]条件判断结构, 而不是[ ... ], 能够防止脚本中的许多逻辑错误

- 算术测试用(())
- 文件测试操作符
-e 文件存在
-f  这个文件是一般文件(并不是目录或设备文件)
-s  文件大小不为零
-d  表示这是一个目录
-b 表示这是一个块设备
-c 表示这是一个字符设备
-p 这个文件是一个管道
-h 这是一个符合链接
-L 这是一个符合链接
-S 表示这是一个socket
-r 文件是否具有可读权限
-w 文件是否具有可写权限
-x 文件是否具有可执行权限
-O 判断你是否是文件的拥有者
-N 从文件上一次被读取到现在，文件是否被修改过
！ 非，反转上边所有测试的结果

- 比较操作符
-eq 等于 if [ "$a" -eq "$b" ]
-ne 不等于 if [ "$a" -ne "$b" ]
-gt 大于 if [ "$a" -gt "$b" ]
-ge 大于等于 if [ "$a" -ge "$b" ]
-lt 小于 if [ "$a" -lt "$b" ]
-le 小于等于 if [ "$a" -le "$b" ]
< 小于，在双引号中使用 if (("$a" < "$b"))
<= 小于等于 if (("$a" <= "$b"))
' > ' 大于 if (("$a" > "$b"))
' >= ' 大于等于 if (("$a" >= "$b"))
-a 逻辑与
-o 逻辑或

- 字符串比较
= 等于 if [ "$a" = "$b"]
== 等于 if [ "$a" == "$b"]
!= 不等号 if [ "$a" != "$b"]
-z 字符串为'null' 字符串长度为零
-n 字符串不为'null'

## 循环

- for循环
for arg in [list]
do
    command
done

- while循环
while [condition]
do
    command
done

- until循环
until [condition-is-true]
do
    command
done

## 测试与分支

- case

    case 变量 in 
    pattern1) command1;;
    pattern2) command2;;
    *) command3;;
    esac

- select
  
    select 变量 in 变量列表
    do
        命令
    done

## 函数

    function name
    {
        commands;
    }

    name()
    {
        commands;
    }

## 内部命令和内建命令

- read
    1. -p 允许再read命令行中直接指定一个提升，可以同时为多个变量赋值
    2. -t 指定read命令等待输入的秒数
    3. -n 限定输入字符个数
    4. -s 使read命令中输入的数据不显示在监视器上
- echo 输出字符串
    1. -n 输出文字后不换行
    2. -e 输出某些特殊字符
- basename 去掉路径信息，只打印文件名
- printf 格式化输出
- cd 修改目录命令
- pwd 打印当前的工作目录
- let 变量的算术操作
- eval 将表达式中的参数 列表组合起来执行
- set 修改内部脚本变量的值 set -- $val 将变量变成位置参数
- unset 把变量设为null
- export 使变量可以被所有的子进程使用
- getopts 分析传递到脚本中命令行参数
- type [cmd] 给出cmd的完整路径
- jobs 在后台列出所有正在运行的作业
- fg 把一个在后台运行的作业放到前台运行
- bg 重新启动一个挂起的作业
- wait 停止脚本的运行，直到后台运行的所有作业都结束为止
- times 给出执行命令所占用的时间
- kill 通过发送一个适当的结束信号，来强制结束一个进程
- ls 列出文件的基本命令
- cat 把文件的内容输出到stdout
- cp 文件拷贝命令
- mv 文件移动命令
- rm 删除一个或多个文件
- rmdir 删除目录
- mkdir 生成目录，创建一个空目录
- chmod 修改一个现存文件的属性
- ln 创建文件链接
- date 日期和时间命令
- time 输出统计出来的命令执行的时间
- touch 创建一个新文件或更新文件被访问或修改的时间
- at 作业控制命令，用来在指定时间上执行指定的命令
- sleep 秒暂停
- usleep 微妙暂停
- hwclock clock 访问或调整硬件时钟
- sort 文件排序
- uniq 删除一个已排序文件中的重复行，这个命令经常出现在sort命令的管道后边
- cut 从文件中提取特定域的命令 -d(字段定界符) -f(域分隔符)
- head 把文件的头部内容打印到stdout 默认10行
- tail 将一个文件结尾部分的内容输出到stdout 默认10行
- wc 统计文件的单词 行等数量
- traceroute 跟踪包发送到远端主机过程中的路由信息
- reset 复位终端参数并且清楚屏幕
- clear 清除控制台
- hexdump 对二进制文件进行16进制 8进制 10进制查看
- m4 宏处理过滤器
- users 显示所有的登录用户
- groups 列出当前用户和他所属的组
- id 列出当前进程真实有效的用户ID 用户的组ID
- who 显示系统上所有已登录的用户
- w 显示所有的登录用户和属于它们的进程
- logname 显示当前用户的登录名
- stty 显示修改终端设置
- setserial 设置或者显示串口参数
- lsof 列出打开的文件
- strace 系统跟踪 跟踪系统调用和信号的诊断和调试工具
- ltrace 库跟踪命令
- nmap 网络映射与端口扫描程序
- nc 连接和监听tcp和udp端口
- uptime 显示系统运行的时间
- hostname 显示系统的主机名
- hostid 用16进制显示主机的32位ID
- ulimit 设置系统资源的使用上限
- umask 设定用户创建文件时缺省的权限
- ldd 显示一个可执行文件和它所需要共享库之间的依赖关系
- watch 以指定的时间间隔来重复运行一个命令
- strip 从可执行文件中去掉调试符号的引用
- nm 列出未strip过的经过编译的2进制文件的全部符号
- alise 创建别名
- trap 捕获信号
