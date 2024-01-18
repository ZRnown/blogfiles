---
title: Numpy和Pandas学习
date: 2024-01-01 18:40:00
toc: true
tags:
    - Python
category: Computer
excerpt: "关于python的numpy和pandas"
---

## numpy
**array对象的背景**

- Numpy的核心数据结构，就叫做array就是数组，array对象可以是一维数组，也可以是多维数组；
- Python的List也可以实现相同的功能，但是array比List的优点在于性能好、包含数组元数据信息、大量的便捷函数；
- Numpy成为事实上的Scipy、Pandas、Scikit-Learn、Tensorflow、PaddlePaddle等框架的“通用底层语言”
- Numpy的array和Python的List的一个区别，是它元素必须都是同一种数据类型，比如都是数字int类型，这也是Numpy高性能的一个原因；

**array本身的属性**
- shape：返回一个元组，表示array的维度
- ndim：一个数字，表示array的维度的数目
- size：一个数字，表示array中所有数据元素的数目
- dtype：array中元素的数据类型

**创建array的方法**
- 从Python的列表List和嵌套列表创建array
- 使用预定函数arange、ones/ones_like、zeros/zeros_like、empty/empty_like、full/full_like、eye等函数创建
- 生成随机数的np.random模块构建

**array本身支持的大量操作和函数**
- 直接逐元素的加减乘除等算数操作
- 更好用的面向多维的数组索引
- 求sum/mean等聚合函数
- 线性代数函数，比如求解逆矩阵、求解方程组
### 创建array的便捷函数
使用arange创建数字序列
`np.arange([start,] stop[, step,], dtype=None)`
```python
>>> np.arange(10)
array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
>>> np.arange(2,10,2)
array([2, 4, 6, 8])

```
### 创建一维和二维数组

#### 使用 Python List 和嵌套 List 创建数组

```python
import numpy as np

# 创建一维数组
x = np.array([1, 2, 3, 4, 5, 6, 7, 8])

# 创建二维数组
X = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
探索数组属性
x.shape  # 返回一维数组的形状 (8,)
X.shape  # 返回二维数组的形状 (2, 4)

x.ndim  # 返回一维数组的维度 1
X.ndim  # 返回二维数组的维度 2

x.size  # 返回一维数组的元素个数 8
X.size  # 返回二维数组的元素个数 8

x.dtype  # 返回一维数组的数据类型 dtype('int32')
X.dtype  # 返回二维数组的数据类型 dtype('int32')
```
创建数组的便捷函数
使用 arange 创建数字序列
```python
np.arange(10)  # 创建序列 0 到 9 的数组
np.arange(2, 10, 2)  # 创建序列 2 到 9，步长为 2 的数组
使用 ones 和 ones_like 创建全 1 数组
```
```python
np.ones(10)  # 创建长度为 10 的全 1 数组
np.ones((2, 3))  # 创建形状为 (2, 3) 的全 1 数组

np.ones_like(x)  # 创建与一维数组 x 形状相同的全 1 数组
np.ones_like(X)  # 创建与二维数组 X 形状相同的全 1 数组
```

使用 zeros 和 zeros_like 创建全 0 数组

```python
np.zeros(10)  # 创建长度为 10 的全 0 数组
np.zeros((2, 4))  # 创建形状为 (2, 4) 的全 0 数组

np.zeros_like(x)  # 创建与一维数组 x 形状相同的全 0 数组
np.zeros_like(X)  # 创建与二维数组 X 形状相同的全 0 数组
```

使用 empty 和 empty_like 创建未初始化数组

```python
np.empty(10)  # 创建长度为 10 的未初始化数组
np.empty((2, 4))  # 创建形状为 (2, 4) 的未初始化数组

np.empty_like(x)  # 创建与一维数组 x 形状相同的未初始化数组
np.empty_like(X)  # 创建与二维数组 X 形状相同的未初始化数组
```

使用 full 和 full_like 创建指定值数组

```python
np.full(10, 666)  # 创建长度为 10，填充值为 666 的数组
np.full((2, 4), 333)  # 创建形状为 (2, 4)，填充值为 333 的数组

np.full_like(x, 666)  # 创建与一维数组 x 形状相同，填充值为 666 的数组
np.full_like(X, 666)  # 创建与二维数组 X 形状相同，填充值为 666 的数组
```

使用 random 模块生成随机数数组

```python
np.random.randn()  # 生成一个随机数
np.random.randn(3)  # 生成含有 3 个随机数的数组
np.random.randn(3, 2)  # 生成形状为 (3, 2) 的随机数数组
np.random.randn(3, 2, 4)  # 生成形状为 (3, 2, 4) 的随机数数组
```

array 支持的操作和函数

```python
A = np.arange(10).reshape(2, 5)  # 创建并重塑数组 A
A  # 显示数组 A

A.shape  # 返回数组 A 的形状 (2, 5)
A + 1  # 数组 A 中的每个元素加 1
A * 3  # 数组 A 中的每个元素乘以 3

np.sin(A)  # 数组 A 中每个元素的正弦值
np.exp(A)  # 数组 A 中每个元素的指数值

B = np.random.randn(2, 5)  # 创建随机数组 B
B  # 显示数组 B

A + B  # 数组 A 和数组 B 对应位置的元素相加
A - B  # 数组 A 和数组 B 对应位置的元素相减
```

## Numpy对数组按索引查询

Numpy中有三种索引方法：

- 基础索引
- 神奇索引
- 布尔索引

### 基础索引

```python
import numpy as np

x = np.arange(10)

x[2], x[5], x[-1]  # 2 5 9

x[2:4]  # array([2, 3])
x[2:-1]  # array([2, 3, 4, 5, 6, 7, 8])
x[-3:]  # array([7, 8, 9])
x[:-3]  # array([0, 1, 2, 3, 4, 5, 6])
```

二维数组

```python
X  = np.arange(20).reshape(4,5)

X[0, 0]  # 0
X[-1, 2]  # 17

X[2]  # array([10, 11, 12, 13, 14])
X[-1]  # array([15, 16, 17, 18, 19])

X[:2, 2:4]  # array([[2, 3], [7, 8]])
X[:, 2]  # array([ 2,  7, 12, 17])
```

### 神奇索引
一维数组


```python
x = np.arange(10)

x[[3,4,7]]  # array([3, 4, 7])

indexs = np.array([[0, 2], [1, 3]])
x[indexs]  # array([[0, 2], [1, 3]])

```


二维数组
```python
X  = np.arange(20).reshape(4, 5)

X[[0, 2]]  # array([[ 0,  1,  2,  3,  4], [10, 11, 12, 13, 14]])
X[[0, 2], :]  # array([[ 0,  1,  2,  3,  4], [10, 11, 12, 13, 14]])

X[:, [0,2,3]]  # array([[ 0,  2,  3], [ 5,  7,  8], [10, 12, 13], [15, 17, 18]])
X[[0, 2, 3], [1, 3, 4]]  # array([ 1, 13, 19])

```

### 布尔索引

一维数组

```python
x = np.arange(10)

x[x > 5]  # array([6, 7, 8, 9])

x[x <= 5] = 0
x[x > 5] = 1
x  # array([0, 0, 0, 0, 0, 0, 1, 1, 1, 1])
```

二维数组

```python
X  = np.arange(20).reshape(4, 5)

X[X > 5]  # array([ 6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])

X[X[:, 3] > 5]  # array([[ 5,  6,  7,  8,  9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19]])
```

条件的组合

```python
x = np.arange(10)

condition = (x % 2 == 0) | (x > 7)
x[condition]  # array([0, 2, 4, 6, 8, 9])
```

## Numpy常用Random随机函数汇总

Numpy提供了多种随机数生成函数，以下是常用的随机函数及示例：

### 1. `np.random.rand(d0, d1, ..., dn)`
返回数据在 [0, 1) 之间，具有均匀分布。

- 一维数组：

    ```python
    np.random.rand(5)  
    # array([0.70043712, 0.84418664, 0.67651434, 0.72785806, 0.95145796])
    ```

- 二维数组：

    ```python
    np.random.rand(3, 4)
    # array([[0.0127032 , 0.4135877 , 0.04881279, 0.09992856],
    #        [0.50806631, 0.20024754, 0.74415417, 0.192892  ],
    #        [0.70084475, 0.29322811, 0.77447945, 0.00510884]])
    ```

### 2. `np.random.randn(d0, d1, ..., dn)`
返回数据具有标准正态分布（均值为0，方差为1）。

- 一维数组：

    ```python
    np.random.randn(5)  
    # array([-1.20990266, -0.04618272, -0.44118244,  0.46953431,  0.44325817])
    ```

- 二维数组：

    ```python
    np.random.randn(3, 4)
    # array([[-1.66738875, -1.81731749, -1.39753916,  0.78392691],
    #        [-0.29129965,  0.67049043,  0.706931  ,  1.42965241],
    #        [-0.41407013, -1.32672274, -0.14880188,  0.34771289]])
    ```

### 3. `np.random.randint(low[, high, size, dtype])`
生成随机整数，包含low，不包含high。

示例：

- 单个整数：

    ```python
    np.random.randint(3)  # 2
    ```

- 指定范围的整数：

    ```python
    np.random.randint(10, 30, size=(5,))
    # array([27, 16, 25, 18, 18])
    ```

### 4. `np.random.random([size])`
生成 [0.0, 1.0) 之间的随机数。

示例：

- 一维数组：

    ```python
    np.random.random(5)  
    # array([0.95858105, 0.66579831, 0.84015904, 0.14691185, 0.14394403])
    ```

- 二维数组：

    ```python
    np.random.random(size=(3,4))
    # array([[0.30843116, 0.37016398, 0.31852964, 0.56240025],
    #        [0.4640979 , 0.80066784, 0.78735522, 0.84323067],
    #        [0.68824287, 0.31854825, 0.93794112, 0.40711455]])
    ```

### 5. `np.random.choice(a[, size, replace, p])`
从数组a中生成随机结果。

### 6. `np.random.shuffle(x)`
将数组x进行随机排列。

### 7. `np.random.permutation(x)`
将数组x进行随机排列或者数字的全排列。

### 8. `np.random.normal([loc, scale, size])`
按照给定的平均值loc和方差scale生成高斯分布的数字。

### 9. `np.random.uniform([low, high, size])`
在指定范围内生成均匀分布的随机数。

详细使用方法和示例可以参考[Numpy官方文档](https://docs.scipy.org/doc/numpy-1.14.0/reference/routines.random.html)。

## Numpy的数学统计函数

### 1. Numpy有哪些数学统计函数：

| 函数名       | 说明                 |
|--------------|----------------------|
| np.sum       | 所有元素的和         |
| np.prod      | 所有元素的乘积       |
| np.cumsum    | 元素的累积加和       |
| np.cumprod   | 元素的累积乘积       |
| np.min       | 最小值               |
| np.max       | 最大值               |
| np.percentile| 0-100百分位数        |
| np.quantile  | 0-1分位数            |
| np.median    | 中位数               |
| np.average   | 加权平均，参数可以指定weights |
| np.mean      | 平均值               |
| np.std       | 标准差               |
| np.var       | 方差                 |

### 2. 怎样实现按不同的axis计算

以上函数，都有一个参数叫做axis用于指定计算轴为行还是列，如果不指定，那么会计算所有元素的结果

### 3. 实例：机器学习将数据进行标准化

```python
import numpy as np

# 示例数组
arr = np.arange(12).reshape(3,4)
print(arr)

# Numpy的数学统计函数示例
print(np.sum(arr))
print(np.prod(arr))
print(np.cumsum(arr))
print(np.cumprod(arr))
print(np.min(arr))
print(np.max(arr))
print(np.percentile(arr, [25, 50, 75]))
print(np.quantile(arr, [0.25, 0.5, 0.75]))
print(np.median(arr))
print(np.mean(arr))
print(np.std(arr))
print(np.var(arr))

# weights的shape需要和arr一样
weights = np.random.rand(*arr.shape)
print(np.average(arr, weights=weights))

# Numpy的axis参数的用途
print(arr.sum(axis=0))
print(arr.sum(axis=1))
print(arr.cumsum(axis=0))
print(arr.cumsum(axis=1))

# 数据标准化示例
mean = np.mean(arr, axis=0)
print(mean)
std = np.std(arr, axis=0)
print(std)

# 计算分子，注意每行都会分别减去[4., 5., 6., 7.]，这叫做numpy的广播
fenzi = arr - mean
print(fenzi)

result = fenzi / std
print(result)
```

## Numpy计算数组中满足条件元素个数

使用numpy的random模块生成1亿个数字

```python
import numpy as np

arr = np.random.randint(1, 10000, size=int(1e8))
print(arr[:10])
print(arr.size)
```

使用Python原生语法实现

```python
pyarr = list(arr)
result_py = len([x for x in pyarr if x > 5000])
print(result_py)

%timeit len([x for x in pyarr if x > 5000])
```

使用numpy的向量化操作实现

```python
result_np = arr[arr > 5000].size
print(result_np)
print(arr[arr > 5000][:10])
```

## Numpy怎样给数组增加一个维度

在处理数据时，有时需要增加数组的维度，以下是三种方法：

1. 使用 np.newaxis 关键字

```python
import numpy as np

arr = np.arange(5)
print(arr)
print(arr.shape)

# 给一维向量添加一个行维度
print(arr[np.newaxis, :])
print(arr[np.newaxis, :].shape)

# 给一维向量添加一个列维度
print(arr[:, np.newaxis])
print(arr[:, np.newaxis].shape)
```
2. 使用 np.expand_dims 方法

```python
import numpy as np

arr = np.arange(5)
print(arr)

# 给一维数组添加一个行维度
# 相当于 arr[np.newaxis, :]
print(np.expand_dims(arr, axis=0))
print(np.expand_dims(arr, axis=0).shape)

# 给一维数组添加一个列维度
# 相当于 arr[:, np.newaxis]
print(np.expand_dims(arr, axis=1))
print(np.expand_dims(arr, axis=1).shape)
```
3. 使用 np.reshape 方法

```python
import numpy as np

arr = np.arange(5)
print(arr)

# 给一维数组添加一个行维度
print(np.reshape(arr, (1, 5)))
print(np.reshape(arr, (1, -1)))
print(np.reshape(arr, (1, -1)).shape)

# 给一维数组添加一个列维度
print(np.reshape(arr, (-1, 1)))
print(np.reshape(arr, (-1, 1)).shape)
```
以上三种方法都能在不改变数据的情况下增加数组的维度，便于在多维数据处理中进行维度匹配和操作。

# Numpy非常重要有用的数组合并操作

在数据处理中，常常需要合并不同来源的数据。以下是数组合并的几种重要方法：

## 1. 给数据添加新的多行

```python
import numpy as np

a = np.arange(6).reshape(2,3)
b = np.random.randint(10, 20, size=(4,3))

print(a)
print(b)
```

方法1：使用 `np.concatenate()`

```
print(np.concatenate([a, b]))
"""
合并结果：
[[ 0  1  2]
 [ 3  4  5]
 [11 17 12]
 [12 19 17]
 [15 13 15]
 [17 18 16]]
"""

```

方法2：使用 np.vstack() 或 np.row_stack()

```
print(np.vstack([a, b]))
"""
合并结果：
[[ 0  1  2]
 [ 3  4  5]
 [11 17 12]
 [12 19 17]
 [15 13 15]
 [17 18 16]]
"""

print(np.row_stack([a, b]))
"""
合并结果：
[[ 0  1  2]
 [ 3  4  5]
 [11 17 12]
 [12 19 17]
 [15 13 15]
 [17 18 16]]
"""
```

2. 给数据添加新的多列

```
a = np.arange(12).reshape(3,4)
b = np.random.randint(10, 20, size=(3,2))

print(a)
print(b)

```

方法1：使用 `np.concatenate()` 指定 `axis=1`

```
print(np.concatenate([a, b], axis=1))
"""
合并结果：
[[ 0  1  2  3 15 19]
 [ 4  5  6  7 11 14]
 [ 8  9 10 11 16 15]]
"""

```

方法2：使用 `np.hstack()` 

```
print(np.hstack([a, b]))
"""
合并结果：
[[ 0  1  2  3 15 19]
 [ 4  5  6  7 11 14]
 [ 8  9 10 11 16 15]]
"""

```

方法3：使用 `np.column_stack()`

```
print(np.column_stack([a, b]))
"""
合并结果：
[[ 0  1  2  3 15 19]
 [ 4  5  6  7 11 14]
 [ 8  9 10 11 16 15]]
"""
```

## Numpy怎样对数组排序

Numpy提供了三种排序方法：

1. `np.sort`：返回排序后数组的拷贝。
2. `array.sort`：原地排序数组而不是返回拷贝。
3. `np.argsort`：间接排序，返回排序后的数字索引。

这些方法都支持参数`kind`，可用值包括：

- `quicksort`：快速排序，平均O(nlogn)，不稳定情况。
- `mergesort`：归并排序，平均O(nlogn)，稳定排序。
- `heapsort`：堆排序，平均O(nlogn)，不稳定排序。
- `stable`：稳定排序。

默认`kind`是`quicksort`，保持默认即可。

```python
import numpy as np

arr = np.array([3, 2, 4, 5, 1, 9, 7, 8, 6])

# np.sort 返回排序后的数组
sorted_arr = np.sort(arr)
print(sorted_arr)  # 输出排序后的数组

# array.sort 进行原地排序
arr.sort()
print(arr)  # 输出原地排序后的数组

# np.argsort 返回排序后的索引
indices = np.argsort(arr)
print(indices)  # 输出排序后的索引数组
print(arr[indices])  # 输出排序后的数组按索引重排
```
## Numpy与Pandas数据的相互转换

### Numpy数组转换为Pandas数据结构

一维数组转换为Pandas的Series

```python
import numpy as np
import pandas as pd

arr = np.arange(10)
series = pd.Series(arr)
```

二维数组转换为Pandas的DataFrame

```
arr = np.random.randint(1, 10, size=(5, 4))
df = pd.DataFrame(arr, columns=["ca", "cb", "cc", "cd"])
```

### Pandas数据结构转换为Numpy数组

将Pandas的Series转换为Numpy数组

```
series = pd.Series(range(10))
series_values = series.values
series_to_numpy = series.to_numpy()
```

将Pandas的DataFrame转换为Numpy数组

```
df = pd.DataFrame([
    [11, 12.23, 45.23],
    [21, 22.23, 55.23],
    [31, 32.23, 65.23],
    [41, 42.23, 75.23]
], columns=["feature_a", "feature_b", "feature_c"])

df_values = df.values
df_to_numpy = df.to_numpy()
```

## Numpy的缺失值处理
在NumPy中，处理缺失值通常涉及使用掩码或特殊函数来识别、过滤或填充这些值。

使用np.nan表示缺失值：

```python
import numpy as np
arr = np.array([1, 2, np.nan, 4, 5])
```


检测缺失值：


```
np.isnan()：检测数组中的缺失值。
np.isfinite()：检测有限值。
```

```
np.isnan(arr)  # 返回一个布尔掩码，指示数组中的缺失值
```

过滤或填充缺失值：
`np.nan_to_num()`：将缺失值替换为特定值。
`np.nanmean()、np.nanmedian()`：计算数组中忽略缺失值的均值或中位数。
`np.where()`：条件替换。

```python
arr[np.isnan(arr)] = 0  # 将缺失值替换为0
arr_filled = np.nan_to_num(arr, nan=-1)  # 将缺失值替换为-1
```

处理包含缺失值的数据：
NumPy通常不是用于处理包含不同数据类型或缺失值的复杂数据集的最佳工具。对于更复杂的数据操作和缺失值处理，通常使用Pandas库会更合适。