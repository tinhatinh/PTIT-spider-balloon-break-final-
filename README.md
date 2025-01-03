# Game Thu Thập Bóng Bay - Assembly (DOS)

## Mô Tả
Trò chơi "Thu Thập Bóng Bay" là một trò chơi đơn giản được lập trình bằng Assembly cho môi trường DOS. Người chơi sẽ điều khiển ký tự '*' để thu thập các bóng bay 'O' xuất hiện trên màn hình nhằm ghi điểm.

## Cách Cài Đặt

### Yêu Cầu Hệ Thống
- Hệ điều hành: DOS hoặc DOSBox
- Công cụ biên dịch: MASM (Microsoft Macro Assembler)
- Công cụ liên kết: LINK (Microsoft Linker)

## Cách Chơi

### Điều Khiển
- Mũi tên ↑: Di chuyển lên
- Mũi tên ↓: Di chuyển xuống
- Mũi tên ←: Di chuyển trái
- Mũi tên →: Di chuyển phải

### Mục Tiêu
- Thu thập các bóng bay 'O' để ghi điểm. Mỗi bóng bay thu thập được sẽ tăng 1 điểm.
- Bóng bay sẽ xuất hiện ngẫu nhiên sau khi được thu thập.

### Kết Thúc Trò Chơi
- Nhấn Q hoặc ESC để thoát.
- Sau khi kết thúc, nhấn T để chơi lại hoặc ESC để thoát.

## Cấu Trúc Code

### Phần Data
- Vị trí người chơi (player_x, player_y)
- Vị trí bóng bay (balloon_x, balloon_y)
- Điểm số (score)
- Các thông báo và hướng dẫn

### Các Thủ Tục Chính
- `display_score`: Hiển thị điểm
- `clear_screen`: Xóa màn hình
- `display_final_score`: Hiển thị điểm cuối cùng
- `main`: Vòng lặp chính của trò chơi

## Tính Năng
- Hiển thị điểm theo thời gian thực
- Sinh vị trí ngẫu nhiên cho bóng bay
- Phát hiện va chạm
- Chơi lại nhiều lần
- Điều khiển mượt mà

## Giới Hạn
- Chạy trong môi trường DOS
- Độ phân giải màn hình: text mode
- Không có âm thanh
- Không lưu điểm cao

## Phát Triển Trong Tương Lai
- Thêm hiệu ứng âm thanh
- Lưu điểm cao
- Thêm chướng ngại vật
- Thêm các power-up
- Thêm nhiều cấp độ khó

## Đóng Góp
Mọi đóng góp đều được hoan nghênh. Hãy tạo pull request hoặc báo cáo lỗi nếu bạn phát hiện.

## Giấy Phép
MIT License

---

**Được phát triển bởi Danh Phan - 2024**  
[Facebook](https://www.facebook.com/doanhbatduocemleuleu)
