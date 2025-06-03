CREATE DATABASE car_rental;
USE car_rental;

-- Create member Table
CREATE TABLE member(
	google_id VARCHAR(22) NOT NULL PRIMARY KEY,
	gmail VARCHAR(50) NOT NULL UNIQUE KEY,
	phone VARCHAR(10) NOT NULL UNIQUE KEY,
    CHECK (google_id REGEXP '^[0-9]{21,22}$'),
    CHECK (gmail REGEXP '^[a-zA-Z0-9._%+-]{6,30}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    CHECK (phone REGEXP '^09[0-9]{8}$')
);

-- Create location
CREATE TABLE location (
    loc_id VARCHAR(4) NOT NULL PRIMARY KEY CHECK (loc_id REGEXP '^[A-Z]{4}$'),
    loc_name VARCHAR(6) NOT NULL CHECK (loc_name REGEXP '^[一-龥A-Za-z]{2,5}店$'),
    city VARCHAR(3) NOT NULL CHECK (city REGEXP '^(臺北市|新北市|桃園市|臺中市|臺南市|高雄市|基隆市|新竹市|嘉義市|新竹縣|苗栗縣|彰化縣|南投縣|雲林縣|嘉義縣|屏東縣|宜蘭縣|花蓮縣|臺東縣|澎湖縣|金門縣|連江縣)$'),
    district VARCHAR(4) NOT NULL CHECK(district REGEXP '^[一-龥]{1,3}(區|市|鎮|鄉)$'),
    address VARCHAR(50) NOT NULL,
    CHECK (address REGEXP '^([一-龥]{1,3}(村|里))?([0-9]{1,3}鄰)?[一-龥]+(路|街|大道)([一二三四五六七八九十]{1,3}段)?([0-9]+巷)?([0-9]+弄)?([0-9]{1,4}之)?[0-9]{1,4}號([0-9]{1,3}樓(之[0-9]+)?)?([一-龥A-Za-z0-9]+室)?$')
);

-- Create insurance Table
CREATE TABLE insurance(
    insurance_id VARCHAR(7) NOT NULL PRIMARY KEY CHECK (insurance_id REGEXP '^[A-Z0-9]{7}$'),
    ins_name VARCHAR(20) NOT NULL UNIQUE KEY CHECK (ins_name REGEXP '^[一-龥A-Za-z\(\)（）]{3,15}$'),
    coverage VARCHAR(250) NOT NULL CHECK (coverage REGEXP '^[一-龥A-Za-z0-9\(\)，。、（）：:「」　 ]{1,250}$'),
    ins_fee INT NOT NULL CHECK (ins_fee >= 0)
);

-- Create model Table
CREATE TABLE model(
	model_id VARCHAR(7) NOT NULL PRIMARY KEY CHECK (model_id REGEXP '^[A-Z0-9]{7}$'),
	brand VARCHAR(20) NOT NULL,
	model_name VARCHAR(20) NOT NULL,
	car_type VARCHAR(7) NOT NULL CHECK (car_type IN ('Compact', 'Sedan', 'SUV', 'MPV')),
	fuel_type VARCHAR(8) NOT NULL CHECK (fuel_type IN ('Gasoline', 'Electric', 'Hybrid')),
	engine_cc INT NOT NULL CHECK (engine_cc >= 0),
	transmission INT NOT NULL CHECK (transmission IN (0, 1)),
	image_url VARCHAR(50) NOT NULL CHECK (image_url REGEXP '^img\/[A-Za-z0-9_]+\.(jpg|png)$')
);

-- Create car Table
CREATE TABLE car (
    vin VARCHAR(17) NOT NULL PRIMARY KEY CHECK (vin REGEXP '^[A-HJ-NPR-Za-hj-npr-z0-9]{8}[0-9X][A-HJ-NPR-Za-hj-npr-z0-9]{2}[0-9]{6}$'),
    plate_number VARCHAR(8) NOT NULL UNIQUE KEY CHECK (plate_number REGEXP '^R[A-Z]{2}-[0-35-9]{4}$'),
    daily_fee INT NOT NULL CHECK (daily_fee > 0),
    late_fee INT NOT NULL CHECK (late_fee > 0),
    year_made INT NOT NULL CHECK (year_made >= 1980),
    seat_num INT NOT NULL CHECK (seat_num > 0 and seat_num < 16),
    color VARCHAR(5) NOT NULL CHECK (color REGEXP '^[一-龥]{1,4}色$'),
    mileage INT NOT NULL CHECK (mileage > 0),
    car_status VARCHAR(12) NOT NULL DEFAULT 'available' CHECK (car_status IN ('available', 'maintenance', 'disable')),
    notes TEXT,
    model_id VARCHAR(7) NOT NULL,
    loc_id VARCHAR(4),
    FOREIGN KEY (model_id) REFERENCES model(model_id) 
    	ON DELETE NO ACTION,
    FOREIGN KEY (loc_id) REFERENCES location(loc_id) 
    	ON DELETE SET NULL
);

-- Create rental Table
CREATE TABLE rental (
    google_id VARCHAR(22) NOT NULL,
    created_at DATETIME NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    actual_return DATETIME,
    rental_status VARCHAR(9) NOT NULL CHECK (rental_status IN ('pending', 'active', 'completed', 'cancelled', 'reject')),
    amount INT NOT NULL CHECK (amount >= 0),
    payment_date DATETIME,
    method VARCHAR(8) NOT NULL CHECK (method IN ('cash', 'credit', 'linepay')),
    car_vin VARCHAR(17) NOT NULL,
    pickup_loc VARCHAR(4) NOT NULL,
    drop_loc VARCHAR(4) NOT NULL,
    insurance_id VARCHAR(7) NOT NULL,
    CONSTRAINT fk_google_id FOREIGN KEY (google_id) REFERENCES member(google_id)
    	ON DELETE CASCADE,
    CONSTRAINT fk_car_vin FOREIGN KEY (car_vin) REFERENCES car(vin)
    	ON DELETE NO ACTION,
    CONSTRAINT fk_pickup_loc FOREIGN KEY (pickup_loc) REFERENCES location(loc_id) 
    	ON DELETE NO ACTION,
    CONSTRAINT fk_drop_loc FOREIGN KEY (drop_loc) REFERENCES location(loc_id) 
    	ON DELETE NO ACTION,
    CONSTRAINT fk_insurance_id FOREIGN KEY (insurance_id) REFERENCES insurance(insurance_id) 
    	ON DELETE NO ACTION,
    PRIMARY KEY (google_id,created_at)
);
