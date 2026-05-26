# 成員介紹 Flutter App

一個使用 Flutter 製作的角色／成員介紹應用程式。

本專案使用 `NestedScrollView`、`SliverAppBar` 與 `TabBar` 建立角色詳細頁面，並透過卡片式 UI 顯示成員資訊與偏好資料。

---

# 功能介紹

## 成員詳細頁面

- 大型角色封面圖片
- 可收合 AppBar
- Tab 分頁切換
- Material Design 卡片介面

## 分頁內容

### 介紹頁

顯示：

- 成員描述
- 人物介紹
- 詳細資訊

### 偏好頁

以 GridView 卡片方式顯示：

- 喜歡的事物
- 討厭的事物
- 生日
- 星座

---

# 使用技術

- Flutter
- Dart
- Material UI
- NestedScrollView
- SliverAppBar
- TabBar / TabBarView
- GridView

---

# 專案結構

```text
lib/
├── models/
│   └── member.dart
├── pages/
│   └── member_detail_page.dart
└── main.dart
```

---

# 執行方式

## 安裝套件

```bash
flutter pub get
```

## 執行專案

```bash
flutter run
```

---

# 資料模型

Member 資料包含：

```dart
name
image
description
suki
kirai
birthday
zodiac
```

---

# UI 特點

## SliverAppBar

- 支援圖片背景
- 支援滑動收合
- 固定 TabBar

## GridView 偏好卡片

- 響應式排列
- 卡片陰影效果
- 圓角設計

---

# Screenshot

可在此加入專案截圖：

```markdown
![preview](assets/screenshot.png)
```

---

# 作者

- Name: 林維祥 (ZOT)
- GitHub: Zot012

---

# License

本專案僅供學習用途。
