---
title: Python学习笔记
date: 2023-12-23 20:16:39
toc: true
tags: 
    - Python
category: Computer
excerpt: "本文以记录自己从零学习Python的历程,在这里分享一些知识和理解"
---
# 前言
&emsp;&emsp;为了学校机器人实验室1月12号的考核,我现在开始从零学习python以及opencv视觉库,此文记录我的学习笔记和想法.

## 基础语法
### 注释
&emsp;&emsp;以#开头的是单行注释,多行注释可以是`"""`或者`'''`
```python
#注释1

"""
多行注释1
多行注释2
"""
```
### 缩进
&emsp;&emsp;和其他语言用大括号来区分代码块不同,python用缩进来标识代码块,空格和tab均可,如果是空格要保证同一代码块的空格数量相同

```python
if s>0:
    print("1")
else:
    print("2")
```
### 打印

```python
#默认以空格分隔
>>>print("a","b","c")
a b c
#修改分隔符
>>>print("a","b","c",sep=",")
a,b,c
#结尾不换行
>>>print("a","b","c",sep=",",end=".")
a,b,c.
>>>print("ab\'c")
ab'c
```
### 变量和类型
- 变量以数字字母和下划线命名,不能以数字开头
- 命名中多个单词以下划线分开,大小写敏感,不需要提前声明
- protected实例变量以下划线开头
- private实例变量以双下划线开头
```python
file_name = "temp.txt" #变量赋值
a,b = 1,2 #多个变量可以同时赋值,以逗号分开
```
#### 常见基本类型
- 整型,支持任意大小的整型,只有int没有long
- 浮点型,支持科学记数法,比如111e-2表示1.11
- 布尔,True和False(注意大小写),可以通过比较获得temp = a > b
- 复数,虚部用j来表示,比如64.23+3j
- 字符串,单引号或者双引号包裹的文本,python中没有char的概念,char就是长度为1的字符串

**类型之间可以进行转换**
```python
>>> s="12"
>>> int(s) #字符串转int
12
>>> s="12.3"
>>> float(s) #字符串转float
12.3
>>> num=16
>>> hex(num) #整型转16进制字符串
'0x10'
```
### 运算符
#### 下标:[]
下标支持从左到右:以0开始;从右到左;以-1开始
```python
>>> s="123"
>>> s[0]
'1'
>>> s[-1]
'3'
```
可以参考下面这张图
```
 +---+---+---+---+---+---+
 | P | y | t | h | o | n |
 +---+---+---+---+---+---+
   0   1   2   3   4   5
  -6  -5  -4  -3  -2  -1
```
#### 切片:[left:right]
切片支持按照索引来反回子序列,包含left,不包含right
```python
>>> s="123456789"
>>> s[0:2]
'12'
>>> s[4:]
'56789'
>>> s[:-3]
'123456'
```
#### 成员运算符:and or not
```python
>>> s = 'Python'
>>> s.startswith("P") and s.endswith("n")
True
>>> s.startswith("P") or s.endswith("K")
True
>>> not s.startswith("P")
False
```
### 字符串
用三引号(`"""`或者`'''`表示一个多行字符串,换行符会自动包含在里面)
```python
>>> print('''First line 
... second line
... third line''')
First line
second line
third line
```
用加号可以连接字符串：

```python
>>> "Hello" + " " + "Leo"
'Hello Leo'
```
格式化字符字面值:在字符串开始加上f/F,然后就可以在字符串内部用{}引用表达式的值,这点和shell很像
```python
>>> year=2019
>>> month=6
>>> day=18
>>> print(f"Today is {year} {month} {day}")
'Today is 2019 6 18'
```
格式化的时候可以指定字符串的最小宽度,这样能够打印出对齐的列
```python
>>> info={'year':2019,'day':18,'month':6}
>>> for key,value in info.items():
...     print(f'{key:10} : {value:10}')
...
year    :     2019
day     :       18
month   :       6
```

Chatgpt的解释:
>&emsp;&emsp;这段 Python 代码创建了一个字典 info，其中包含了年份、日期和月份的信息。
>首先，字典 info 包含了三个键值对：year 对应值为 2019,day 对应值为 18,month 对应值为 6
>然后，代码进入了一个 for 循环。info.items() 返回一个由字典中的键值对组成的元组列表，每个元组中包含键和对应的值。
>&emsp;&emsp;for key, value in info.items(): 这一行代码迭代字典 info 中的键值对。在每次迭代中，key 变量获取键，value 变量获取对应的值。
>&emsp;&emsp;在循环的每次迭代中，print(f'{key:10} : {value:10}') 这行代码使用了 f-string 格式化输出，其中：>{key:10} 和 {value:10} 分别表示将 key 和 value 输出为字符串，并确保它们各自占据至少 10 个字符的宽度。:10 表示将输出的字符串对齐到 10 个字符的宽度，如果不足 10 个字符，则会用空格进行填充。

str.format同样可以格式化字符串
```python
>>> print("a{}{}".format("b","c"))
'abc'
```
也可以用关键字参数引用:
```python
>>> print("Today is {year} {month} {day}".format(year=2019,month=6,day=18))
'Today is 2019 6 18'
```
可以用**符号,将map作为关键字传递:
```python
>>> info={'year':2019,'day':18,'month':6}
>>> print("Today is {year} {month} {day}".format(**info))
'Today is 2019 6 18'
```
内置函数vars()会把局部变量以字典返回,可以配合**来做格式化
```python
>>> print("Today is {year} {month} {day}".format(**vars()))
'Today is 2019 6 18'
```
>&emsp;&emsp;解包操作符(**):用于将字典或关键字参数解包为函数或方法的参数。这个操作符允许你将字典中的键值对或关键字参数作为函数调用时的参数传递给函数。
>&emsp;&emsp;在函数调用时，传统的方式是将参数一个一个地传递给函数。但是有时你可能有一个字典，想要将字典中的键值对作为参数传递给函数，这时就可以使用解包操作符 **。
>&emsp;&emsp;上文提到过,字符串支持切片,但不能用索引修改字符串的值,因为字符串是不可变的
```python
>>> s="python"
>>> print(s[2:])
'thon'
>>> s[0]="T" #字符串是不可变的
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'str' object does not support item assignment
```
### 流程控制
**if**
```python
>>> s="Python"
>>> if len(s) < 3:
...     print("length less than 3")
... elif len(s) < 5:
...     print("length less than 5")
... else:
...     print("length greater than 5")
... 
length greater than 5
```
**for in**
python的for语句是用来遍历序列的:
```python
>>> words = ['Hello','Leo']
>>> for word in words:
...     print(word)
... 
'Hello'
'Leo'
```
用range函数,可以创建一个数字序列
```python
>>> for i in range(3):
...     print(i)
...
0
1
2
```
字典可以同时遍历key,value:
```python
>>> info={'year':2019,'day':18,'month':6}
>>> for key,value in info.items():
...     print(f'{key:10} : {value:10}')
```
序列可以用enumerate函数同时遍历index,value:
```python
>>> for index,word in enumerate(words):
...     print(index,word)
... 
0 Hello
1 Leo
```
break/continue可以跳出和基序循环,这点和C语言一样
```python
>>> for i in range(5):
...     if i > 3:
...             break
...     print(i)
... 
0
1
2
3
```
**while**
while的语法和C语言也类似
```python
>>> i = 0
>>> while i < 5:
...     print(i)
...     i = i + 1
```
**else**
while和for都支持else语句,当循环条件不满足的时候执行,但是注意break语句不会触发else语句
```python
>>> i = 0
>>> while i < 5:
...     print(i)
...     i = i + 1
... else:
...     print("Not less than 5")
... 
0
1
2
3
4
Not less than 5
```
**pass**
当你在语法上需要一个占位符的时候,可以用pass语句,这个分支结构啥也不做
```python
#定义一个空函数,如果没有pass语句,python会报错
>>> def initlog(*args):
...     pass   
...
```
### 列表
列表(list)和其他语言的数组一样,用来存储一组值,列表支持索引和切片,是可变类型:
```python
#创建列表
>>> l=[1,2,3]
#列表最后添加一个元素
>>> l.append(4)
#修改列表的第一个元素
>>> l[0]=5
#对列表切片,返回一个新的列表
>>> l1=l[0:1]
#删除列表的最后一个元素,并返回
>>> l.pop()
#删除指定位置元素
>>> del l[0]
#删除全部元素
>>> del l[:]
```
#### 列表脚本操作符
列表对 + 和 * 的操作符与字符串相似。+ 号用于组合列表，* 号用于重复列表。
| Python表达式                     | 结果                  | 描述               |
| :------------------------------- | :-------------------- | :----------------- |
| len([1,2,3])                     | 3                     | 长度               |
| [1,2,3]+[4,5,6]                  | [1,2,3,4,5,6]         | 组合               |
| ['Hi']*4                         | ['Hi','Hi','Hi','Hi'] | 重复               |
| 3 in [1,2,3]                     | True                  | 元素是否存在于列表 |
| for x in [1,2,3]:print(x,end="") | 1 2 3                 | 迭代               |

#### 嵌套列表
使用嵌套列表即在列表里创建其他列表,例如
```python
>>> a=['a', 'b', 'c']
>>> n=[1,2,3]
>>> x=[a,n]
>>> x
[['a','b','c'],[1,2,3]]
>>> x[0]
['a','b','c']
>>> x[0][1]
'b'
```
#### 列表比较
列表比较需要引入`operator`库的`eq`方法
```python
#导入operator模块
>>>import operator
>>>a=[1,2]
>>>b=[2,3]
>>>c=[2,3]
>>>print("opearator.eq(a,b):",operator.eq(a,b))
>>>print("opearator.eq(c,b):",operator.eq(c,b))
opearator.eq(a,b): False
opearator.eq(c,b): True
```
>在 Python 中，operator 模块中的 eq 方法并不用于直接比较两个列表是否相同。operator 模块中的 eq 方法用于检查两个对象是否相等，实际上它等同于使用 == 运算符。

>当你使用 operator.eq() 比较两个列表时，它会执行与 == 相同的操作，比较两个列表是否具有相同的内容和结构。但这并不会比较两个列表是否是同一个对象（即相同的内存引用）。

>要比较两个列表是否完全相同（包括内容和内存引用），可以直接使用 == 运算符或者使用 operator.eq() 方法，但要注意，对于列表相等的判断，它们只检查内容是否相同，而不会检查是否是同一个对象。

#### 列表函数&方法
Python包含以下函数
| 函数      | 作用               |
| :-------- | :----------------- |
| len(list) | 返回列表元素个数   |
| max(list) | 返回列表元素最大值 |
| min(list) | 返回列表元素最小值 |
| list(seq) | 将元组转换为列表   |

Python包含以下方法:


| 方法                                | 作用                                                               |
| :---------------------------------- | :----------------------------------------------------------------- |
| list.append(obj)                    | 在列表末尾添加新的对象                                             |
| list.count(obj)                     | 统计某个元素在列表中出现的次数                                     |
| list.extend(seq)                    | 在列表末尾一次性追加另一个序列中的多个值（用新列表扩展原来的列表） |
| list.index(obj)                     | 从列表中找出某个值第一个匹配项的索引位置                           |
| list.insert(index, obj)             | 将对象插入列表                                                     |
| list.pop([index=-1])                | 移除列表中的一个元素（默认最后一个元素），并且返回该元素的值       |
| list.remove(obj)                    | 移除列表中某个值的第一个匹配项                                     |
| list.reverse()                      | 反向列表中元素                                                     |
| list.sort( key=None, reverse=False) | 对原列表进行排序                                                   |
| list.clear()                        | 清空列表                                                           |
| list.copy()                         | 复制列表                                                           |
### 元组
元组(tuple)是用逗号分隔的一组值,通常由括号包裹,和列表的区别是元组是不可变的:
```python
>>> t=(1,2,'3')
>>> type(t)
<class 'tuple'>
#索引访问值
>>> print(t[0])
1
# 元组截取
>>> tup = ('Google', 'Runoob', 'Taobao', 'Wiki', 'Weibo','Weixin')
>>> tup[1:]
('Runoob', 'Taobao', 'Wiki', 'Weibo', 'Weixin')
#序列解包,同时解开多个值
>>> a,b,c=t
>>> print(a,b,c)
1 2 3
```
元组中只包含一个元素时，需要在元素后面添加逗号 , ，否则括号会被当作运算符使用：
```python
>>> tup1=(50)
>>> type(tup1)
<class 'int'>
>>> tup1=(50,)
>>> type(tup1)
<class 'tuple'>
```
#### 访问元组
元组可以使用下标索引来访问元组中的值
```python
>>>tup1 = ('Google', 'Runoob', 1997, 2000)
>>>tup2 = (1, 2, 3, 4, 5, 6, 7 )
>>>print ("tup1[0]: ", tup1[0])
>>>print ("tup2[1:5]: ", tup2[1:5])
tup1[0]: Google
tup2[1:5]: (2,3,4,5)
```
#### 修改元组
元组中的元素值时不允许修改的,但是我们可以对元组进行连接组合
```python
>>> tup1=(12,34.56)
>>> tup2=('abc','xyz')
# 以下修改元组的元素操作是非法的
# tup1[0]=100
#创建一个新的元组
>>> tup3=tup1+tup2
>>> print(tup3)
(12,34.56,'abc','xyz')
```
#### 删除元组
元组中的元素值是不允许删除的,但是我们可以使用del语句来删除整个元组
```python
>>> tup=('Google','Runoob',1997,2000)
>>>print(tup)
>>>del tup
>>>print("删除后的元组 tup:")
>>>print(tup)
删除后的元组 tup : 
Traceback (most recent call last):
  File "test.py", line 8, in <module>
    print (tup)
NameError: name 'tup' is not defined
```
#### 元组运算符
与与字符串一样，元组之间可以使用 `+`、`+=`和 `*` 号进行运算。这就意味着他们可以组合和复制，运算后会生成一个新的元组。
```python
>>>len((1,2,3))
3
>>> a=(1,2,3)
>>> b=(4,5,6)
>>> c=a+b
>>> c
(1,2,3,4,5,6)
>>> a=(1,2,3)
>>> b=(4,5,6)
>>> a+=b
>>> a
(1,2,3,4,5,6)
>>> ('Hi',)*4
('Hi', 'Hi', 'Hi', 'Hi')
>>> 3 in (1,2,3)
True
>>> for x in (1, 2, 3): 
    print (x, end=" ")
1 2 3
```
#### 元组内置函数
| 函数            | 描述                     |
| :-------------- | :----------------------- |
| len(tuple)      | 计算元组元素个数。       |
| max(tuple)      | 返回元组中元素最大值。   |
| min(tuple)      | 返回元组中元素最小值。   |
| tuple(iterable) | 将可迭代系列转换为元组。 |

#### 关于元组是不可变的
所谓元组的不可变指的是元组所指向的内存中的内容不可变。
```python
>>> tup = ('r', 'u', 'n', 'o', 'o', 'b')
>>> tup[0] = 'g'     # 不支持修改元素
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
>>> id(tup)     # 查看内存地址
4440687904
>>> tup = (1,2,3)
>>> id(tup)
4441088800    # 内存地址不一样了
```
从以上实例可以看出，重新赋值的元组 tup，绑定到新的对象了，不是修改了原来的对象。

### 集合
集合(set)用来表示不重复元素的无序的集,可以用`{}`或者`set`创建,空集合只能用`set()`创建,而不是 `{}`，因为 `{}` 是用来创建一个空字典。集合是可变的
```python
>>> a={1,2,3}
>>> b=set([2,3,4])
#遍历
>>> for element in a:
...     print(element)
... 
1
2
3
#添加元素
>>> a.add(5)
#删除元素
>>> a.remove(5)
#元素是否存在
>>> 1 in a
#集合运算
>>> print(a-b)
{1}
>>> print(a|b)
{1,2,3,4}
>>> print(a&b)
{2, 3}
```

类似列表推导式，同样集合支持集合推导式(Set comprehension):
```python
>>> a = {x for x in 'abracadabra' if x not in 'abc'}
>>> a
{'r', 'd'}
```
#### 集合的基本操作
**添加元素**
将元素 x 添加到集合 s 中，如果元素已存在，则不进行任何操作。
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.add("Facebook")
>>> print(thisset)
{'Taobao', 'Facebook', 'Google', 'Runoob'}
```
还有一个方法，也可以添加元素，且参数可以是列表，元组，字典等
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.update({1,3})
>>> print(thisset)
{1, 3, 'Google', 'Taobao', 'Runoob'}
>>> thisset.update([1,4],[5,6])  
>>> print(thisset)
{1, 3, 4, 5, 6, 'Google', 'Taobao', 'Runoob'}
```
**移除元素**

将元素 x 从集合 s 中移除，如果元素不存在，则会发生错误。
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.remove("Taobao")
>>> print(thisset)
{'Google', 'Runoob'}
>>> thisset.remove("Facebook")   # 不存在会发生错误
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Facebook'
```
此外还有一个方法也是移除集合中的元素，且如果元素不存在，不会发生错误。

```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.discard("Facebook")  # 不存在不会发生错误
>>> print(thisset)
{'Taobao', 'Google', 'Runoob'}
```
我们也可以设置随机删除集合中的一个元素
```python
#set 集合的 pop 方法会对集合进行无序的排列，然后将这个无序排列集合的左面第一个元素进行删除。
>>> thisset = set(("Google", "Runoob", "Taobao", "Facebook"))
>>> x = thisset.pop()
>>> print(x)
Runoob
```
**计算集合元素个数**
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> len(thisset)
3
```
**清空集合**
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.clear()
>>> print(thisset)
set()
```
**判断元素是否在集合中存在**
```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> "Runoob" in thisset
True
>>> "Facebook" in thisset
False
```
#### 集合内置方法完整列表
| 方法                          | 描述                                                                                           |
| :---------------------------- | :--------------------------------------------------------------------------------------------- |
| add()                         | 为集合添加元素                                                                                 |
| clear()                       | 移除集合中的所有元素                                                                           |
| copy()                        | 拷贝一个集合                                                                                   |
| difference()                  | 返回多个集合的差集                                                                             |
| difference_update()           | 移除集合中的元素，该元素在指定的集合也存在。                                                   |
| discard()                     | 删除集合中指定的元素                                                                           |
| intersection()                | 返回集合的交集                                                                                 |
| intersection_update()         | 返回集合的交集。                                                                               |
| isdisjoint()                  | 判断两个集合是否包含相同的元素，如果没有返回 True，否则返回 False。                            |
| issubset()                    | 判断指定集合是否为该方法参数集合的子集。                                                       |
| issuperset()                  | 判断该方法的参数集合是否为指定集合的子集                                                       |
| pop()                         | 随机移除元素                                                                                   |
| remove()                      | 移除指定元素                                                                                   |
| symmetric_difference()        | 返回两个集合中不重复的元素集合。                                                               |
| symmetric_difference_update() | 移除当前集合中在另外一个指定集合相同的元素，并将另外一个指定集合中不同的元素插入到当前集合中。 |
| union()                       | 返回两个集合的并集                                                                             |
| update()                      | 给集合添加元素                                                                                 |
| len()                         | 计算集合元素个数                                                                               |
### 字典
字典(dict)是一种key-value的数据结构,任何不可变的类型都可以作为key
字典的每个键值 `key=>value` 对用冒号 `:` 分割，每个对之间用逗号`,`分割，整个字典包括在花括号 `{}` 中,字典的键必须是唯一的，但值则不必。
值可以取任何数据类型，但键必须是不可变的，如字符串，数字。
>注意：`dict` 作为 Python 的关键字和内置函数，变量名不建议命名为 `dict`。

可以像下面这样创建字典
```python
tinydict = {'name': 'runoob', 'likes': 123, 'url': 'www.runoob.com'}
tinydict1 = { 'abc': 456 }
tinydict2 = { 'abc': 123, 98.6: 37}
```
```python
#初始化值
>>> temp={'a':1, 'b':2}
#修改值
>>> temp['a']=3
#访问值
>>> temp['a']
3
#遍历
>>> for key,value in temp.items():
...     print(key,value)
... 
a 3
b 2 
#删除
>>> del temp['a']
#按插入顺序返回key
>>> list(temp)
['b','c']
# 清空字典
>>> temp.clear()
#字典的构造函数可以从键值对里创造
>>> temp=dict([('a',1),('b',2),('c',3)])
```

#### 创建空字典
使用大括号`{}`创建空字典
```python
# 使用大括号 {} 来创建空字典
>>> emptyDict = {}
# 打印字典
>>> print(emptyDict)
{}
# 查看字典的数量
>>> print("Length:", len(emptyDict))
Length: 0
# 查看类型
>>> print(type(emptyDict))
<class 'dict'>
```
使用内建函数 `dict()` 创建字典：
```python
>>> emptyDict = dict()
# 打印字典
>>> print(emptyDict)
{}
# 查看字典的数量
>>> print("Length:",len(emptyDict))
Length: 0
# 查看类型
>>> print(type(emptyDict))
<class: 'dict'>
```
#### 访问字典里的值
把相应的键放入到方括号中
```python
>>> tinydict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'}
>>> print ("tinydict['Name']: ", tinydict['Name'])
tinydict['name']: Runoob
>>> print ("tinydict['Age']: ", tinydict['Age'])
tinydict['Age']: 7
```
#### 字典键的特性
字典值可以是任何的 python 对象，既可以是标准的对象，也可以是用户定义的，但键不行。
两个重要的点需要记住：
> 1）不允许同一个键出现两次。创建时如果同一个键被赋值两次，后一个值会被记住，如下实例：
```python
>>> tinydict = {'Name': 'Runoob', 'Age': 7, 'Name': '小菜鸟'}
>>> print ("tinydict['Name']: ", tinydict['Name'])
tinydict['Name']:  小菜鸟
```
> 2）键必须不可变，所以可以用数字，字符串或元组充当，而用列表就不行，如下实例：
```python
>>> tinydict = {['Name']: 'Runoob', 'Age': 7}
>>> print ("tinydict['Name']: ", tinydict['Name'])
Traceback (most recent call last):
  File "test.py", line 3, in <module>
    tinydict = {['Name']: 'Runoob', 'Age': 7}
TypeError: unhashable type: 'list'
```

#### 字典内置函数&方法
Python字典包含了以下内置函数：

| 函数           | 描述                                               |
| :------------- | :------------------------------------------------- |
| len(dict)      | 计算字典元素个数，即键的总数。                     |
| str(dict)      | 输出字典，可以打印的字符串表示。                   |
| type(variable) | 返回输入的变量类型，如果变量是字典就返回字典类型。 |

Python字典包含了以下内置方法：

| 方法                               | 描述                                                                   |
| :--------------------------------- | :--------------------------------------------------------------------- |
| dict.clear()                       | 删除字典内所有元素                                                     |
| dict.copy()                        | 返回一个字典的浅复制                                                   |
| dict.fromkeys()                    | 创建一个新字典，以序列seq中元素做字典的键，val为字典所有键对应的初始值 |
| dict.get(key, default=None)        | 返回指定键的值，如果键不在字典中返回 default 设置的默认值              |
| key in dict                        | 如果键在字典dict里返回true，否则返回false                              |
| dict.items()                       | 以列表返回一个视图对象                                                 |
| dict.keys()                        | 返回一个视图对象                                                       |
| dict.setdefault(key, default=None) | 和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default       |
| dict.update(dict2)                 | 把字典dict2的键/值对更新到dict里                                       |
| dict.values()                      | 返回一个视图对象                                                       |
| pop(key[,default])                 | 删除字典 key（键）所对应的值，返回被删除的值。                         |
| popitem()                          | 返回并删除字典中的最后一对键和值。                                     |

### 函数
函数可以让你灵活的组织和复用代码,定义一个函数,以def表示函数定义,括号来表示参数,return来返回值,函数体以缩进表示:
```python
>>> def add(a,b)
...     sum=a+b
...     return sum
... 
>>> add(1,2)
3
```
函数内部的变量存储在**局部符号表**里,在进行符号访问时,依次查找局部符号表,然后是外层函数的布局符号表,最后是内置符号表

所以:
- 函数内可以访问全局变量
- 局部变量和全局变量重名,会访问到全局变量
```python
>>> def (a,b)
...     print(temp)
...     return a+b
... 
>>> temp=1
>>> temp = "Hi"
>>> add(1,2)
Hi
3
```
函数内部不能直接修改全局变量,但是可以通过global关键字重定义后可修改:
```python
>>> def add(a,b)
...     global c
...     c = 11
...     return a + b + c
... 
>>> c = 1
>>> add(1,2)
14
```
函数参数可以有默认值,这样在调用的时候可以提供更少的参数
```python
def ask_ok(promot,retries=4,reminder="Please try again~"):
    while True:
        ok = input(promot)
        if ok in ('y','ye','yes'):
            return True
        if ok in ('n','no','nope'):
            return False
        retries = retries - 1
        if retries < 0:
            raise ValueError("Invalid input")
        print(reminder)
```
调用的时候,有默认值的参数可以不提供
```python
ask_ok("Developer ?")
ask_ok("Developer ?",2)
ask_ok("Developer ?",reminder="Oh no")
```
注意，默认值只会执行一次，所以当你要修改默认值的时候要慎重，比如：

```python
def f(a, L=[]):
    L.append(a)
    return L
print(f(1))
print(f(2))
print(f(3))
```
输出是
```python
[1]
[1, 2]
[1, 2, 3]
```
这种情况，可以用None来代替：
```python
def f(a, L=None):
    if L is None:
        L = []
    L.append(a)
    return L
```
#### 参数解包
- `*`解包元组或者列表
- `**`解包字典
```python
>>> def add(a,b):
...     return a+b
... 
>>> l = [2,3]
>>> add(*l)
5
>>> dic={'a':3,'b':4}
>>> add(**dic)
7
```
lambda表达式可以用来表示一类无序定义标识符的函数或者子程序：冒号前作为参数，冒号后为表达式：
```python
>>> a = lambda x,y:x*y
>>> a(3,4)
12
```
### 模块

代码多了之后，就产生了两个核心问题
1. 如何组织代码：很明显所有代码写到一个文件里是不合理的
2. 如何复用代码：通用的代码没必要每次都写一遍
在python中，解决这两个问题的方式就是模块。模块是一个包含Python定义和语句的文件，模块名就是文件名去掉.py后缀。

模块还能解决函数重名的问题。同一个文件里，如果定义了两个一样的函数，那么第二个会把第一个覆盖掉，但是在两个模块里，允许出现同名函数。

新建两个文件，logger1和logger2
```python
logger1.py
#!/usr/bin/env python3
 
def log():
  print('hello leo')
  

logger2.py
#!/usr/bin/env python3
 
def log():
  print('hello lina')
```
然后,引用这两个文件,并调用里面的log函数
```python
import logger1,logger2
logger1.log()
logger2.log()
```
输出
```bash
➜ python3 demo.py
hello leo
hello lina
```
引用的时候,可以用别名
```python
import logger1 as l1
import logger2 as l2

l1.log()
l2.log()
```
模块在import的时候，python脚本会从上之下执行，可以通过判断`__name__=='__main__'`来判断是被import，还是直接执行的：
```python
#!/usr/bin/env python3

def log():
    print('hello leo')

#import的时候，不要执行这个方法
if __name__ == '__main__':
   log()
```
### 类
用`class`关键字来定义类,`__init__`来定义构造函数,属性直接通过在构造函数中赋值即可,不像其他语言那样需要证明
```python
class Logger:
    def __init__(self,prefix):
        self.prefix = prefix
    def log_message(self,content):
        print(self.prefix + ":" + content)
```
创建对象和调用方法
```python
l = Logger("Leo")
l.log_message("hi~")
```
属性分为公开和私有的，双下划线开头的表示私有：
```python
class Logger:
    def __init__(self,prefix):
        self.__prefix = prefix
    def log_message(self,content):
        print(self.__prefix + ":" + content)

l = Logger("Leo")
l.log_message("hi~")
print(l.__prefix)
```
然后执行，会发现报错属性找不到
```bash
➜  python python demo.py  
Leo:hi~
Traceback (most recent call last):
  File "demo.py", line 9, in <module>
    print(l.__prefix)
AttributeError: Logger instance has no attribute '__prefix'
```
### 文件
通过open可以打开文件,然后进行读写
- `r`读(默认)
- `w`写(截断之前的内容)
- `x`写,如果之前存在内容会触发异常
- `a`追加内容到文件结尾
- `b`二进制模式
- `t`文本模式(默认)
- `t`读写模式

比如,一个文本文件`content.txt`
```
Environment in Bristol
Economic history of the Russian Federation
Energy in Chile
Employee monitoring
E-Government in South Korea
```
然后,通过read函数读取文件内容,注意打开文件后要关闭
```python
def read_file(file_name):
    f = open(file_name, 'r', encoding='utf-8')
    print(f.read())
    f.close()

if __name__ == '__main__':
    read_file('content.txt')
```
### 异常
python中的异常可以用try-expect-finally来处理
- try执行可能会抛出异常的代码块
- expect捕获异常
- finally一定会执行的代码,一般会用来释放资源等等
```python
def read_file(file_name):
    try:
        with open(file_name,'r',encoding='utf-8') as f:
            for line in f:
                print(line.rstrip())
    except FileNotFoundError as ex:
        print(ex)
        print("File not found")
    finally:
        print("Code always run")

if __name__ == '__main__':
    read_file('abcd.txt')
```
程序里也可以手动抛出异常
```python
raise NameError("test error")
```
python3中，可以通过以下方式查找内置的error
```python
>>> import builtins
>>> dir(builtins)
```

## 文件操作
a模式下写永远会把光标移动到尾部
```python
#汉字占三个字节seek移动指定字节处
file.seek(3)
#tell输出光标位置
file.tell()
file.write("哈哈")
for line in file:
    print(line)
    if line.startswith('abc')
        pass

readline() #读取一行
readlines() #读取所有行,每一行作为一个列表里面的一个元素
print(data.strip())
replace(x,y)
#startswith() 是 Python 字符串的一个方法，用于检查字符串是否以指定的子字符串开头。它返回一个布尔值，指示字符串是否以指定的前缀开头。
```
### 处理xlsx文件
```python
from openpyxl import load_workbook
wb = load_workbook('test.xlsx')
wb.sheetnames#输出所有sheet的name
sheet = wb['sheet1']
cell=sheet.cell(1,1)
cell.value#一行一列的值
cell.style#样式
cell.font#字体信息
cell.alignment#排列情况
```
```python
#1.修改sheet名称
sheet=wb.worksheets[0]
sheet.title='数据集'
wb.save('p2.xlsx')
#2.创建sheet并设置sheet颜色
sheet=wb.create_sheet('工作计划',0)
sheet.sheet_properties.tabColor='1072BA'
wb.save('p2.xlsx')
```
## 需注意
**一种优雅的交换变量方式**
`x,y=y,x`
**一次性输入两个值**
```python
data = input("input two num:")
start, end = map(int, data.split(" "))
```
**二进制八进制十六进制**
```python
dec = int(input("输入数字："))
print("十进制数为：", dec)
print("转换为二进制为：", bin(dec))
print("转换为八进制为：", oct(dec))
print("转换为十六进制为：", hex(dec))
```
**ASCII码与字符相互转换**
```python
# 用户输入字符
c = input("请输入一个字符: ")
 
# 用户输入ASCII码，并将输入的数字转为整型
a = int(input("请输入一个ASCII码: "))
print( c + " 的ASCII 码为", ord(c))
print( a , " 对应的字符为", chr(a))
```
**字符串大小写转换**
```python
str = "www.runoob.com"
print(str.upper())          # 把所有字符中的小写字母转换成大写字母
print(str.lower())          # 把所有字符中的大写字母转换成小写字母
print(str.capitalize())     # 把第一个字母转化为大写字母，其余小写
print(str.title())          # 把每个单词的第一个字母转化为大写，其余小写 
```
**判断字符串**
```python
print(str.isalnum()) # 判断所有字符都是数字或者字母
print(str.isalpha()) # 判断所有字符都是字母
print(str.isdigit()) # 判断所有字符都是数字
print(str.islower()) # 判断所有字符都是小写
print(str.isupper()) # 判断所有字符都是大写
print(str.istitle()) # 判断所有单词都是首字母大写，像标题
print(str.isspace()) # 判断所有字符都是空白字符、\t、\n、\r
```

**移除列表中重复的元素**
```python
arr = [1, 2, 3, 4, 1, 2, 3]
print(list(set(arr)))
```