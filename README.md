Game Thu Thập Bóng Bay - Assembly (DOS)
Mô tả
Đây là một trò chơi đơn giản được viết bằng Assembly cho môi trường DOS. Người chơi điều khiển một ký tự '*' để thu thập các bóng bay 'O' xuất hiện trên màn hình để ghi điểm.

Cách cài đặt
Yêu cầu hệ thống:
DOS hoặc DOSBox
MASM (Microsoft Macro Assembler)
LINK (Microsoft Linker)
Các bước biên dịch:
batch

Copy
MASM GAME.ASM;
LINK GAME.OBJ;
Cách chơi
Điều khiển:
Mũi tên ↑: Di chuyển lên
Mũi tên ↓: Di chuyển xuống
Mũi tên ←: Di chuyển trái
Mũi tên →: Di chuyển phải
Mục tiêu:
Thu thập các bóng bay 'O' để ghi điểm
Mỗi bóng bay thu thập được sẽ tăng 1 điểm
Bóng bay sẽ xuất hiện ngẫu nhiên sau khi được thu thập
Kết thúc trò chơi:
Nhấn Q hoặc ESC để kết thúc
Sau khi kết thúc:
Nhấn T để chơi lại
Nhấn ESC để thoát
Cấu trúc code
Phần Data:
Vị trí người chơi (player_x, player_y)
Vị trí bóng bay (balloon_x, balloon_y)
Điểm số (score)
Các thông báo và hướng dẫn
Các thủ tục chính:
display_score: Hiển thị điểm
clear_screen: Xóa màn hình
display_final_score: Hiển thị điểm cuối cùng
main: Vòng lặp chính của trò chơi
Tính năng
Hiển thị điểm realtime
Sinh vị trí ngẫu nhiên cho bóng bay
Phát hiện va chạm
Chơi lại nhiều lần
Điều khiển mượt mà
Giới hạn
Chạy trong môi trường DOS
Độ phân giải màn hình text mode
Không có âm thanh
Không lưu điểm cao
Phát triển trong tương lai
 Thêm hiệu ứng âm thanh
 Lưu điểm cao
 Thêm chướng ngại vật
 Thêm các power-up
 Thêm nhiều cấp độ khó
Đóng góp
Mọi đóng góp đều được chào đón. Hãy tạo pull request hoặc báo cáo lỗi nếu bạn tìm thấy.

License
MIT License

Được phát triển bởi Danh Phan - 2024
https://www.facebook.com/doanhbatduocemleuleu
