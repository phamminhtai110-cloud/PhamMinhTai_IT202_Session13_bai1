# PhamMinhTai_IT202_Session13_bai1

# [Vận dụng cơ bản 1] - Sự cố dời lịch khám về quá khứ

## 1. Mô tả vấn đề

Hệ thống phòng khám cho phép tiếp tân cập nhật lại ngày giờ khám trong bảng `Appointments`.

Quy tắc nghiệp vụ:

- Ngày khám mới phải nằm ở tương lai.
- Không được phép dời lịch về quá khứ.

Tuy nhiên trigger cũ đang kiểm tra sai dữ liệu nên hệ thống vẫn cho phép cập nhật lịch khám về thời điểm đã qua.

---

# 2. Phân tích lỗi

## Câu lệnh tái hiện lỗi

```sql
UPDATE Appointments
SET appointment_date = '2025-01-15 08:00:00'
WHERE appointment_id = 104;
