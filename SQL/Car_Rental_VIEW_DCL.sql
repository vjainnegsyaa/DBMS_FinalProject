USE car_rental;

CREATE VIEW GU_member_google_view AS
SELECT google_id FROM member;

CREATE VIEW GU_cars_view  AS
SELECT
    c.vin,
    m.brand,
    m.model_name,
    m.car_type,
    m.fuel_type,
    m.engine_cc,
    m.transmission,
    m.image_url,
    c.daily_fee,
    c.late_fee,
    c.seat_num,
    c.notes,
    l.loc_name
FROM car c
JOIN model m ON c.model_id = m.model_id
LEFT JOIN location l ON c.loc_id = l.loc_id
WHERE c.car_status = 'available';

CREATE VIEW GU_rental_schedule_view  AS
SELECT
    r.car_vin as vin,
    r.start_date,
    r.end_date
FROM rental r
JOIN car c ON r.car_vin = c.vin
WHERE r.rental_status IN ('pending', 'active', 'completed')
  AND r.end_date > NOW()
ORDER BY r.car_vin, r.start_date;

CREATE VIEW GU_car_with_rented_time_view  AS
SELECT 
    c.*,
    t.start_date,
    t.end_date
FROM GU_cars as c
LEFT JOIN GU_car_rented_time t ON c.vin = t.vin;


-- GRANT guest_user
CREATE USER 'guest_user'@'localhost' IDENTIFIED BY 'guest_pwd';
-- (TABLE)
GRANT INSERT ON car_rental.member TO 'guest_user'@'localhost';
GRANT SELECT ON car_rental.location TO 'guest_user'@'localhost';
GRANT SELECT ON car_rental.insurance TO 'guest_user'@'localhost';
-- (VIEW)
GRANT SELECT ON car_rental.GU_member_google_view TO 'guest_user'@'localhost';
GRANT SELECT ON car_rental.GU_cars_view TO 'guest_user'@'localhost';
GRANT SELECT ON car_rental.GU_rental_schedule_view TO 'guest_user'@'localhost';
GRANT SELECT ON car_rental.GU_car_with_rented_time_view TO 'guest_user'@'localhost';

-- ---------------------------------------------------------
CREATE VIEW CM_member_phone_VIEW AS
SELECT google_id, phone FROM member;

CREATE VIEW CM_rental_updatable_view AS
SELECT
    google_id,
    created_at,
    rental_status,
    insurance_id
FROM rental;

CREATE VIEW CM_rental_full_view AS
SELECT
    r.google_id,
    r.created_at,
    r.start_date,
    r.end_date,
    r.rental_status,
    r.amount,
    r.method,
    lp.loc_name AS pickup_location_name,
    ld.loc_name AS drop_location_name,
    i.ins_name,
    i.coverage,
    i.ins_fee,
    m.brand,
    m.model_name,
    m.car_type,
    m.fuel_type,
    m.engine_cc,
    m.transmission,
    m.image_url,
    c.daily_fee,
    c.late_fee,
    c.seat_num
FROM rental r
JOIN car c ON r.car_vin = c.vin
JOIN model m ON c.model_id = m.model_id
JOIN location lp ON r.pickup_loc = lp.loc_id
JOIN location ld ON r.drop_loc = ld.loc_id
JOIN insurance i ON r.insurance_id = i.insurance_id;

-- GRANT customer_user
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'customer_pwd';
-- (TABLE)
GRANT SELECT ON car_rental.location TO 'customer_user'@'localhost';
GRANT SELECT ON car_rental.insurance TO 'customer_user'@'localhost';
GRANT INSERT ON car_rental.rental TO 'customer_user'@'localhost';
-- (VIEW)
GRANT SELECT,UPDATE ON car_rental.CM_member_phone_VIEW TO 'customer_user'@'localhost';
GRANT SELECT ON car_rental.GU_cars_view TO 'customer_user'@'localhost';
GRANT SELECT ON car_rental.GU_rental_schedule_view TO 'customer_user'@'localhost';
GRANT SELECT ON car_rental.GU_car_with_rented_time_view TO 'customer_user'@'localhost';
GRANT SELECT ON car_rental.CM_rental_full_view TO 'customer_user'@'localhost';
GRANT UPDATE ON car_rental.CM_rental_updatable_view TO 'customer_user'@'localhost';

-- ---------------------------------------------------------
CREATE VIEW AD_rental_ALL_view AS
SELECT
    r.google_id,
    m.phone,
    r.created_at,
    r.start_date,
    r.end_date,
    r.actual_return,
    r.rental_status,
    r.amount,
    r.method,
    r.car_vin,
    c.plate_number,
    loc_pickup.loc_name AS pickup_location_name,
    loc_drop.loc_name AS drop_location_name,
    r.insurance_id,
    ins.ins_name,
    ins.coverage,
    ins.ins_fee,
    mb.brand,
    mb.model_name,
    mb.car_type,
    mb.fuel_type,
    mb.engine_cc,
    mb.transmission,
    c.seat_num,
    mb.image_url,
    c.daily_fee,
    c.late_fee
FROM rental r
JOIN member m ON r.google_id = m.google_id
JOIN car c ON r.car_vin = c.vin
JOIN model mb ON c.model_id = mb.model_id
JOIN location loc_pickup ON r.pickup_loc = loc_pickup.loc_id
JOIN location loc_drop ON r.drop_loc = loc_drop.loc_id
JOIN insurance ins ON r.insurance_id = ins.insurance_id;

-- GRANT customer_user
CREATE USER 'staff_admin'@'localhost' IDENTIFIED BY 'staff_pwd';
-- (TABLE)
GRANT SELECT ON car_rental.member TO 'staff_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON car_rental.location TO 'staff_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON car_rental.insurance TO 'staff_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON car_rental.model TO 'staff_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON car_rental.car TO 'staff_admin'@'localhost';
GRANT SELECT, UPDATE ON car_rental.rental TO 'staff_admin'@'localhost';
-- (VIEW)
GRANT SELECT ON car_rental.AD_rental_ALL_view TO 'staff_admin'@'localhost';

-- ---------------------------------------------------------
FLUSH PRIVILEGES;
