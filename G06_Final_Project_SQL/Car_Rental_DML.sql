USE car_rental;

-- INSERT member Table
能SELECT member.google_id
能CREATE member
INSERT INTO member (google_id, gmail, phone) VALUES
('879012345678901234567', 'quincy_liu@gmail.com', '0978999000'),
('657890123456789012345', 'kulpia@gmail.com', '0978985123'),
('111996782304424104647', 'gene_st@gmail.com', '0914238500'),
('192703829478239801723', 'Wen_Che@gmail.com', '0932535148'),
('215784230947120938765', 'asd_tw@gmail.com', '0931164655'),
('342057390258473869423', 'kevin_jj@gmail.com', '0923969027'),
('102345678901234567890', 'jane_liu@gmail.com', '0999000111'),
('213456789012345678901', 'kevin_liu@yahoo.com', '0912333444'),
('324567890123456789012', 'lisa_wang@nfu.edu.tw', '0923444555'),
('435678901234567890123', 'mike_smith@wistron.com', '0934555666'),
('546789012345678901234', 'nancy_johnson@foxconn.com', '0945666777'),
('567890123456789012345', 'ethan.lu@yahoo.com', '0944555666'),
('678901234567890123456', 'fiona.lee@nfu.edu.tw', '0955666777'),
('789012345678901234567', 'george.lin@gmail.com', '0966777888'),
('123456789012345678901', 'alice_wu@gmail.com', '0987123456');

-- INSERT location Data
INSERT INTO location (loc_id, loc_name, city, district, address) VALUES
('YUNH', '雲林縣虎尾店', '雲林縣', '虎尾鎮', '文化路64號'),
('YUNL', '雲林縣斗六店', '雲林縣', '阿里山鄉', '大學路三段123號'),
('CHIE', '嘉義市東區店', '嘉義市', '東區', '學府路300號'),
('CHIC', '嘉義縣民雄店', '嘉義縣', '民雄鄉', '神農路145號'),
('YUNN', '雲林縣斗南店', '雲林縣', '斗南鎮', '大業路106號'),
('TCWF', '臺中市霧峰店', '臺中市', '霧峰區', '吉峰東路168號'),
('TCNT', '臺中市南屯店', '臺中市', '南屯區', '大墩路200號'),
('TPXY', '臺北市信義店', '臺北市', '信義區', '松山路100號'),
('NTPC', '新北市板橋店', '新北市', '板橋區', '文化路二段50號'),
('KHLG', '高雄市苓雅店', '高雄市', '苓雅區', '和平一路300號'),
('KHCZ', '高雄市前鎮店', '高雄市', '前鎮區', '中華五路88號'),
('TNED', '臺南市東區店', '臺南市', '東區', '大學路100號'),
('TNNB', '臺南市北區店', '臺南市', '北區', '成功路200號'),
('HSIN', '新竹市東區店', '新竹市', '東區', '光復路一段150號'),
('TYCL', '桃園市中壢店', '桃園市', '中壢區', '中正路300號');

-- INSERT insurance Data
INSERT INTO insurance (insurance_id, ins_name, coverage, ins_fee) VALUES
('Y25S001', '基本保險方案', '第三人責任保險：每人傷害上限200萬、每事故傷害上限400萬、財損上限50萬。駕駛人保險100萬、乘客每人100萬（超載除外）。', 0),
('Y25S002', '第三人責任升級', '每人傷害上限提升至500萬、每事故傷害1000萬、財損上限200萬。其餘條件比照基本方案。', 200),
('Y25S003', '第三人責任與車體損害升級版', '每人傷害上限提升至500萬、每事故傷害1000萬、財損上限200萬。其餘規定比照基本保險。', 400),
('Y25S004', '豪華第三人責任險', '每人傷害上限800萬、每事故傷害1500萬、財損上限300萬，乘客保險每人200萬。不含車體損害。', 600),
('Y25X001', '全方位保險方案', '涵蓋第三人責任升級版保障，並新增車體損失險（含碰撞、自撞、翻車、他人肇逃）、竊盜險。自負額每次事故5000元。', 800),
('Y25X002', '高階全險(免自負額)', '等同全方位保險方案，另提供不限事故次數之免自負額保障。亦納入每日車輛停駛補償保險。', 1400),
('Y25E001', '節能保險方案', '提供基本保險保障，專為電動車設計，另含電池損害與火災保險（限電動車適用）。', 100),
('Y25X003', '超級全險（海外人士專用）', '提供全方位保險保障，另納入外籍駕駛法律援助保險與語言協助。', 1600),
('Y25Z001', '商務菁英保險方案', '含高階全險保障，另增加行程延誤補償與駕駛更換服務，每日最高補償3000元。', 1800),
('Y25Z002', '至尊全險方案', '含所有前述保險保障，另提供不限次數道路救援、全天候代步車服務、全額車損理賠（免自負額）。', 2500);

-- INSERT model Data
INSERT INTO model (model_id, brand, model_name, car_type, fuel_type, engine_cc, transmission, image_url) VALUES
('TOTA012', 'TOYOTA', 'Altis 12', 'Compact', 'Hybrid', 1800, 1, 'img/Altis12.jpg'),
('HONO019', 'HONDA', 'Odyssey 2019', 'MPV', 'Gasoline', 2500, 1, 'img/Odyssey12.jpg'),
('TES3001', 'TESLA', 'Model 3', 'Sedan', 'Electric', 0, 1, 'img/model3.jpg'),
('TOTR022', 'TOYOTA', 'RAV4 2022', 'SUV', 'Hybrid', 2500, 1, 'img/rav4_2022.jpg'),
('MITG001', 'MITSUBISHI', 'Grand Lancer', 'Compact', 'Gasoline', 1500, 1, 'img/glancer.jpg'),
('FODF018', 'FORD', 'Focus 2018', 'Compact', 'Gasoline', 1600, 1, 'img/focus_2018.jpg'),
('HYDT020', 'HYUNDAI', 'Tucson 2020', 'SUV', 'Gasoline', 2000, 1, 'img/tucson_2020.jpg'),
('NISL021', 'NISSAN', 'Leaf 2021', 'Compact', 'Electric', 0, 1, 'img/leaf_2021.jpg'),
('KIAS022', 'KIA', 'Seltos 2022', 'SUV', 'Gasoline', 1600, 1, 'img/seltos_2022.jpg'),
('CMCJ001', 'CMC', 'JSPACE', 'MPV', 'Gasoline', 1500, 0, 'img/CMC_JSPACE.jpg');

-- INSERT car Data
INSERT INTO car (vin, plate_number, model_id, daily_fee, late_fee, year_made, loc_id, seat_num, color, mileage, notes, car_status) VALUES
('4T1BE46KX7U123456', 'RAA-7777', 'TOTA012', 1800, 200, 2020, 'YUNH', 5, '白色', 15000, '可以隨心所欲', 'available'),  -- Altis12
('4T1BE46KXPX123789', 'RAA-8888', 'TOTA012', 1800, 200, 2020, 'YUNL', 5, '白色', 16500, '可以隨心所欲', 'available'),  -- Altis12
('5FNRL38647B654321', 'RAR-2385', 'HONO019', 2200, 200, 2020, 'YUNH', 7, '黑色', 12000, '座椅舒適，適合家庭出遊', 'available'),  -- Odyssey 2019
('5YJ3E1EA7KF123456', 'REK-3556', 'TES3001', 2500, 300, 2021, 'KHLG', 5, '銀色', 8000, '行駛安靜', 'available'),  -- TESLA
('4T3HV36KXPX456781', 'RBC-8811', 'TOTR022', 2200, 300, 2022, 'YUNH', 5, '白色', 7500, '可以隨心所欲SUV', 'available'),  -- RAV4 2022
('4T3HV36KXPX456782', 'RBC-9922', 'TOTR022', 2200, 300, 2022, 'CHIE', 5, '白色', 9200, '可以隨心所欲SUV', 'maintenance'),  -- RAV4 2022
('JMBGR31L6JU123456', 'RAF-5678', 'MITG001', 1700, 200, 2019, 'YUNH', 5, '黑色', 15000, '內裝整潔，冷氣超強', 'available'),  -- Grand Lancer
('1FADP3F2XJL123456', 'RBC-1239', 'FODF018', 1800, 200, 2018, 'TPXY', 5, '銀色', 18000, '油耗低', 'maintenance'),  -- Focus 2018
('KM8K6CA43LU123456', 'RBD-8567', 'HYDT020', 2000, 250, 2020, 'TCWF', 5, '黑色', 5000, '空間寬敞', 'available'),  -- Tucson 2020
('1N4A11APXJC123899', 'RBB-6789', 'NISL021', 1800, 200, 2021, 'TCNT', 5, '綠色', 3000, '行駛安靜', 'available'),  -- Leaf 2021
('1N4A11APXJC123456', 'RBD-1112', 'NISL021', 1800, 200, 2021, 'TCNT', 5, '綠色', 3000, '行駛安靜', 'disable'),  -- Leaf 2021
('KNDJ23AU7L1216211', 'RBZ-2355', 'KIAS022', 1800, 200, 2022, 'CHIC', 5, '藍色', 4000, '小巧靈活，適合城市駕駛', 'disable'),  -- Seltos 2022
('KNDJ23AU7L1234567', 'RBS-8875', 'KIAS022', 1800, 200, 2022, 'TPXY', 5, '藍色', 4000, '小巧靈活，適合城市駕駛', 'disable'),  -- Seltos 2022
('CMBJ1234567890123', 'RAS-1235', 'CMCJ001', 1700, 200, 2019, 'TCWF', 8, '白色', 8000, '空間大，適合家庭出遊', 'available'),  -- CMC JSPACE
('CMBJ1234567890124', 'RAS-5678', 'CMCJ001', 1700, 200, 2019, 'YUNN', 8, '白色', 5500, '空間大，適合家庭出遊', 'available');  -- CMC JSPACE

-- INSERT rental Data
INSERT INTO rental (created_at, google_id, start_date, end_date, actual_return, rental_status,amount, payment_date, method, car_vin, pickup_loc,drop_loc,insurance_id) VALUES
('2025-06-01 13:09:21', '879012345678901234567', '2025-06-02 08:00:00', '2025-06-05 17:00:00', NULL, 'reject', 8000, NULL, 'cash', '4T1BE46KX7U123456', 'YUNH', 'YUNH', 'Y25S002'),
('2025-05-25 13:25:08', '879012345678901234567', '2025-06-13 08:00:00', '2025-06-14 17:00:00', NULL, 'cancelled', 6400, NULL, 'cash', '4T1BE46KX7U123456', 'YUNH', 'YUNH', 'Y25X002'),
('2025-05-01 13:39:19', '657890123456789012345', '2025-07-14 11:05:00', '2025-07-17 23:45:00', NULL, 'active', 12400, NULL, 'cash', 'CMBJ1234567890124', 'YUNN', 'YUNN', 'Y25X002'),
('2025-06-14 18:59:20', '192703829478239801723', '2025-06-18 13:10:00', '2025-06-20 00:40:00', '2025-06-20 00:30:00', 'completed', 5200, '2025-06-15 19:25:00', 'linepay', '5YJ3E1EA7KF123456', 'KHLG', 'KHLG', 'Y25E001'),
('2025-07-08 19:22:26', '111996782304424104647', '2025-07-11 21:30:00', '2025-07-13 21:00:00', NULL, 'active', 4400, '2025-07-08 21:52:34', 'credit', '1N4A11APXJC123899', 'TCNT', 'TCNT', 'Y25S003'),
('2025-06-15 11:44:58', '102345678901234567890', '2025-06-23 09:30:00', '2025-06-27 18:00:00', '2025-06-27 17:55:00', 'completed', 10000, '2025-06-23 09:20:00', 'cash', 'KM8K6CA43LU123456', 'TCWF', 'CHIC', 'Y25S001'),
('2025-06-01 19:45:39', '213456789012345678901', '2025-07-12 07:30:00', '2025-07-13 20:00:00', NULL, 'cancelled', 5200, NULL, 'cash', 'KM8K6CA43LU123456', 'TCWF', 'TCWF', 'Y25S004'),
('2025-06-01 12:22:28', '324567890123456789012', '2025-06-02 06:03:00', '2025-06-04 19:05:00', NULL, 'cancelled', 7800, NULL, 'cash', '4T3HV36KXPX456781', 'KHLG', 'YUNH', 'Y25S003'),
('2025-06-03 09:25:35', '435678901234567890123', '2025-06-07 20:00:00', '2025-06-10 19:05:00', '2025-06-10 19:08:00', 'completed', 10800, '2025-06-07 19:45:30', 'cash', '4T1BE46KX7U123456', 'YUNH', 'YUNL', 'Y25Z001'),
('2025-06-12 08:11:43', '213456789012345678901', '2025-06-19 05:00:00', '2025-06-19 23:00:00', NULL, 'active', 3800, NULL, 'cash', '5FNRL38647B654321', 'YUNH', 'YUNH', 'Y25X003'),
('2025-06-02 13:13:33', '213456789012345678901', '2025-07-15 07:03:00', '2025-07-18 16:06:00', NULL, 'active', 18800, NULL, 'cash', '5FNRL38647B654321', 'YUNH', 'TCNT', 'Y25Z002');
