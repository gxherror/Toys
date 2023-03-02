我们的的第一个项目是编写一个简单的Shell工具myshell，它具有以下属性：

1. 它可以支持以下的内部指令：

- cd <directory>
  - 从当前的默认目录跳转到指定的目录directory。如果没有指定参数directory ，输出当前目录。如果directory目录不存在，输出错误信息。该指令同时要修改环境变量PWD。
- clr：清空屏幕上的显示内容。
- dir <directory>：输出目录directory下的所有内容，包括目录和文件。
- environ：输出所有的环境变量。
- echo <comment>
  - 输出comment的具体内容并换行。当comment 的内容出现多个space或者tab时，应该压缩为一个space。
- help：输出用户指南。
- pause：停止Shell的执行，直到用户按下Enter键。
- quit：退出。
- Shell的环境变量中应该包含shell=<pathname>/myshell。其中<pathname>/myshell 是Shell工具的绝对路径。

2. 所有的其他指令可以通过调用fork与exec完成。父进程通过fork生成子进程，子进程调用exec方法执行用户的指令。注意，子进程在执行时应该包含环境变量parent=<pathname>/myshell，<pathname>/myshell的定义同上。
3. 如果Shell工具在使用时带有参数，那么它可以从参数指定的文件中读取指令，并依次执
   行。例如，当我们这样使用Shell工具时：
   ```myshell batchfile```
   那么，我们会依次读取batchfile文件的每一行并执行。当读取到文件的最后一行时，Shell会退出。
4. 它可以支持输入输出重定向。例如，当我们在Shell中执行以下指令：
   ```programname arg1 arg2 < inputfile > outputfile```
   或者以下指令：```programname arg1 arg2 < inputfile >> outputfile```
   - 其中，programname是可执行指令，arg*是指令的参数。该指令从inputfile中获取用户输入，而不是标准输入stdin；指令执行的结果会输出到outputfile，而不是标准输出stdout。
   - 输出重定向会和dir environ echo help含有输出的内部指令共同使用，输出结果会重定向到用户指定的文件中。例如help > outputfile的执行结果应该输出到用户指定的文件outputfile。
   - 当使用输出重定向时
     - 如果表示重定向的字符串是>，
       - 如果outputfile不存在，则新建文件。
       - 如果outputfile存在，那么输出会覆盖原文件。
     - 如果表示重定向的字符串是>>，
       - 如果outputfile不存在，则新建文件。
       - 如果outputfile存在，那么输出添加到原文件后面。
5. Shell可以支持后台任务的执行。当一条指令后面有&符号时，Shell不需要等待该指令执行结
   束才能返回。
6. Shell工具的prompt应该包含当前目录的地址。注意：我们可以假设所有命令行参数（包括重定向符号<，>和>>和后台执行符号&）通过空格（一个或多个space和tab）与其他命令行参数隔开。