---
title: Opencv学习笔记
date: 2023-12-24 15:03:49
toc: true
tags: 
    - Python
    - opencv
    - 计算机视觉
category: Computer
excerpt: "本文以记录自己从零学习Opencv的历程,在这里分享一些知识和理解"
---
### 缩放
- **函数：** `cv2.resize(src, dsize, fx, fy, interpolation)`
  - `src`：输入图像。
  - `dsize`：输出图像的大小。
  - `fx`、`fy`：水平和垂直方向的缩放因子。
  - `interpolation`：插值方法（如 `cv2.INTER_LINEAR`、`cv2.INTER_NEAREST` 等）。

### 裁剪
裁剪操作本质上是对图像的区域选取。可以使用数组切片操作（如 `image[y1:y2, x1:x2]`）或 `cv2.crop()` 函数来实现。

### 绘制点、矩形和圆形
- **函数：** `cv2.circle(img, center, radius, color, thickness)`
  - `img`：目标图像。
  - `center`：圆心坐标。
  - `radius`：圆的半径。
  - `color`：绘制颜色。
  - `thickness`：线条宽度。

- **函数：** `cv2.rectangle(img, pt1, pt2, color, thickness)`
  - `img`：目标图像。
  - `pt1`、`pt2`：矩形的对角线两个点。
  - `color`：绘制颜色。
  - `thickness`：线条宽度。

- **函数：** `cv2.line(img, pt1, pt2, color, thickness)`
  - `img`：目标图像。
  - `pt1`、`pt2`：线段的两个端点。
  - `color`：绘制颜色。
  - `thickness`：线条宽度。

### 图像滤波
#### 中值滤波
- **函数：** `cv2.medianBlur(src, ksize)`
  - `src`：输入图像。
  - `ksize`：滤波核大小。

#### 平均滤波
- **函数：** `cv2.blur(src, ksize)`
  - `src`：输入图像。
  - `ksize`：滤波核大小。

#### 高斯滤波
- **函数：** `cv2.GaussianBlur(src, ksize, sigmaX)`
  - `src`：输入图像。
  - `ksize`：滤波核大小。
  - `sigmaX`：X 方向的高斯核标准差。

#### 锐化
- **函数：** 锐化可以通过卷积操作与原始图像进行组合实现。
  - 锐化核可以是用户定义的，例如使用 `cv2.filter2D()` 进行卷积操作。

### 图像操作示例

#### 缩放

```python
import cv2

# 读取图像
image = cv2.imread('input.jpg')

# 缩放图像
resized = cv2.resize(image, (new_width, new_height), interpolation=cv2.INTER_LINEAR)

```
#### 裁剪
```python
import cv2

# 读取图像
image = cv2.imread('input.jpg')

# 裁剪图像
cropped = image[startY:endY, startX:endX]

```

#### 绘制点，直线，矩形，圆形
```python
import cv2

# 创建空白图像
image = np.zeros((500, 500, 3), dtype=np.uint8)

cv2.circle(image, (100, 100), 2, (255, 255, 255), thickness=-1)

# 绘制矩形
cv2.rectangle(image, (50, 50), (200, 200), (0, 255, 0), thickness=2)

# 绘制圆形
cv2.circle(image, (250, 250), 50, (0, 0, 255), thickness=-1)

```
### 图像滤波示例

#### 中值滤波

```python
import cv2

# 读取图像
image = cv2.imread('input.jpg')

# 中值滤波
median = cv2.medianBlur(image, ksize=5)

```
#### 高斯滤波

```python
import cv2

# 读取图像
image = cv2.imread('input.jpg')

# 高斯滤波
blurred = cv2.GaussianBlur(image, (5, 5), sigmaX=0)

```

#### 平均滤波

```python

import cv2

# 读取图像
image = cv2.imread('input.jpg')

# 平均滤波
averaged = cv2.blur(image, (5, 5))

```
#### 锐化（卷积操作）
```python
import cv2
import numpy as np

# 读取图像
image = cv2.imread('input.jpg')

# 锐化核
kernel = np.array([[0, -1, 0],
                   [-1, 5, -1],
                   [0, -1, 0]])

# 进行卷积操作
sharpened = cv2.filter2D(image, -1, kernel)

```


### 杂七杂八

### 图像旋转

**OpenCV 图像翻转函数 `cv2.flip()`**

- `cv2.flip(src, flipCode)`: 要翻转的输入图像和翻转操作的方向，其中`flipCode`是一个整数值，控制图像翻转的方向。
  - `src`: 要翻转的输入图像。
  - `flipCode > 0`: 沿着水平方向翻转图像。
  - `flipCode = 0`: 沿着垂直方向翻转图像。
  - `flipCode < 0`: 同时沿着水平和垂直方向翻转图像。

**OpenCV 图像旋转函数 `cv2.rotate()`**

- `cv2.rotate(src, rotateCode)`: 要旋转的输入图像和旋转操作的方式，其中`rotateCode`是一个整数值，控制图像的旋转方向。
  - `src`: 要旋转的输入图像。
  - `cv2.ROTATE_90_CLOCKWISE`: 顺时针旋转 90 度。
  - `cv2.ROTATE_90_COUNTERCLOCKWISE`: 逆时针旋转 90 度。
  - `cv2.ROTATE_180`: 旋转 180 度。
