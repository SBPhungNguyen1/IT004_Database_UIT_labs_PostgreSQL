# IT004_Database_UIT_labs_PostgreSQL

> 🇺🇸 **English** *(Vietnamese below)*

Repository containing all laboratory assignments and solutions for the course **IT004 - Database Systems** at the **University of Information Technology (UIT) - Vietnam National University Ho Chi Minh City (VNU-HCM)**. All exercises are implemented using **PostgreSQL** and managed with **pgAdmin 4**.

The primary purpose of this repository is to:
- Review and reinforce database concepts.
- Practice SQL querying and database design.
- Preserve personal laboratory solutions for future reference.
- Provide a PostgreSQL version of the original UIT database labs.

---

## 📌 Table of Contents

- [📖 Introduction](#-introduction)
- [📁 Project Structure](#-project-structure)
- [🛠 Environment & Tools](#-environment--tools)
- [🚀 Getting Started](#-getting-started)
- [✅ Lab Status](#-lab-status)
- [📝 Notes](#-notes)
- [🇻🇳 Vietnamese Version](#-vietnamese-version)

---

## 📖 Introduction

The **IT004 - Database Systems** course introduces the fundamental concepts of relational databases, including:

- Relational Algebra
- SQL (DDL, DML, DQL)
- Aggregate Functions
- `GROUP BY` and `HAVING`
- Subqueries
- Joins (`INNER JOIN`, `LEFT JOIN`, etc.)
- Constraints
- Views
- Triggers
- Stored Procedures / Functions (PostgreSQL)

All SQL scripts in this repository are written and tested on **PostgreSQL**.

---

## 📁 Project Structure

```text
IT004_Database_UIT_labs_PostgreSQL/
├── bt1_quanlybanhang/
│   └── sql_lab_b1_v1.sql           # Sales Management lab solution
├── bt2_quanlygiaovu/
│   └── sql_lab_b2_v1.sql           # Academic Management lab solution
├── labs/
│   ├── TH_CSDL_Tuan01.pdf
│   ├── TH_CSDL_Tuan02.pdf
│   ├── TH_CSDL_Tuan03.pdf
│   ├── TH_CSDL_Tuan04.pdf
│   ├── TH_CSDL_Tuan05.pdf
│   └── baitapTH_CSDL_KCNTT.docx
└── README.md
```

---

## 🛠 Environment & Tools

- PostgreSQL
- pgAdmin 4
- SQL
- Git
- GitHub

---

## 🚀 Getting Started

1. Clone this repository.

```bash
git clone https://github.com/SBPhungNguyen1/IT004_Database_UIT_labs_PostgreSQL.git
```

2. Open **pgAdmin 4** and connect to your PostgreSQL server.

3. Create a database.

```sql
CREATE DATABASE it004_lab;
```

4. Execute the SQL scripts inside each lab folder.

Example:

```text
bt1_quanlybanhang/sql_lab_b1_v1.sql
```

---

## ✅ Lab Status

| Lab | Topic | Status |
|------|-------|--------|
| Lab 1 | Sales Management | ✅ Completed |
| Lab 2 | Academic Management | 🚧 In Progress |
| Future Labs | To be updated | ⏳ Planned |

---

## 📝 Notes

- All solutions are intended for **educational purposes**.
- SQL syntax may differ slightly from MySQL or SQL Server because these exercises are implemented using **PostgreSQL**.
- The original laboratory handouts belong to UIT and are included here only for learning and review purposes.

---

# Vietnamese below

---

# IT004_Database_UIT_labs_PostgreSQL

Repository này lưu trữ toàn bộ đề bài và bài giải thực hành (Lab) môn **IT004 - Cơ sở dữ liệu** tại **Trường Đại học Công nghệ Thông tin (UIT) - ĐHQG-HCM**, được thực hiện trên hệ quản trị cơ sở dữ liệu **PostgreSQL** bằng **pgAdmin 4**.

Mục đích của repository là:

- Ôn tập kiến thức môn Cơ sở dữ liệu.
- Luyện tập kỹ năng truy vấn SQL.
- Lưu trữ bài làm cá nhân.
- Chuyển đổi các bài thực hành UIT sang PostgreSQL.

---

## 📌 Mục lục

- [📖 Giới thiệu](#-giới-thiệu)
- [📁 Cấu trúc thư mục](#-cấu-trúc-thư-mục)
- [🛠 Môi trường & Công cụ](#-môi-trường--công-cụ)
- [🚀 Hướng dẫn sử dụng](#-hướng-dẫn-sử-dụng)
- [✅ Trạng thái bài tập](#-trạng-thái-bài-tập)
- [📝 Ghi chú](#-ghi-chú)

---

## 📖 Giới thiệu

Môn học **IT004 - Cơ sở dữ liệu** cung cấp các kiến thức nền tảng về:

- Đại số quan hệ (Relational Algebra)
- Ngôn ngữ truy vấn SQL (DDL, DML, DQL)
- Hàm tổng hợp (Aggregate Functions)
- `GROUP BY`, `HAVING`
- Truy vấn con (Subquery)
- Phép nối (`JOIN`)
- Ràng buộc toàn vẹn (Constraints)
- View
- Trigger
- Stored Procedure / Function trên PostgreSQL

Toàn bộ các bài thực hành trong repository đều được viết và kiểm thử trên **PostgreSQL**.

---

## 📁 Cấu trúc thư mục

```text
IT004_Database_UIT_labs_PostgreSQL/
├── bt1_quanlybanhang/
│   └── sql_lab_b1_v1.sql           # Script giải bài tập Quản lý bán hàng
├── bt2_quanlygiaovu/
│   └── sql_lab_b2_v1.sql           # Script giải bài tập Quản lý giáo vụ
├── labs/
│   ├── TH_CSDL_Tuan01.pdf
│   ├── TH_CSDL_Tuan02.pdf
│   ├── TH_CSDL_Tuan03.pdf
│   ├── TH_CSDL_Tuan04.pdf
│   ├── TH_CSDL_Tuan05.pdf
│   └── baitapTH_CSDL_KCNTT.docx
└── README.md
```

---

## 🛠 Môi trường & Công cụ

- PostgreSQL
- pgAdmin 4
- SQL
- Git
- GitHub

---

## 🚀 Hướng dẫn sử dụng

### 1. Clone repository

```bash
git clone https://github.com/SBPhungNguyen1/IT004_Database_UIT_labs_PostgreSQL.git
```

### 2. Mở pgAdmin 4 và kết nối PostgreSQL

### 3. Tạo cơ sở dữ liệu

```sql
CREATE DATABASE it004_lab;
```

### 4. Chạy các file SQL

Ví dụ:

```text
bt1_quanlybanhang/sql_lab_b1_v1.sql
```

---

## ✅ Trạng thái bài tập

| Bài | Nội dung | Trạng thái |
|------|----------|------------|
| Bài 1 | Quản lý bán hàng | ✅ Hoàn thành |
| Bài 2 | Quản lý giáo vụ | 🚧 Đang cập nhật |
| Các bài tiếp theo | Chưa cập nhật | ⏳ Dự kiến |

---

## 📝 Ghi chú

- Repository được xây dựng nhằm mục đích học tập và ôn tập.
- Cú pháp SQL sử dụng là **PostgreSQL**, vì vậy có thể khác với MySQL hoặc SQL Server.
- Các tài liệu đề bài thuộc bản quyền của Trường Đại học Công nghệ Thông tin (UIT) và được lưu trữ tại đây phục vụ mục đích học tập cá nhân.
