# DBMS_FinalProject_G06
# Subject: 租車管理系統
● 50915112 廖子科、 51015107 廖玟嫻、51015130 林敬雅   
●表格設計:  
Users(使用者):UserID(主鍵)、RoleID(外鍵)、Username、Email、Password、Phone。  
Roles(角色權限):RoleID(主鍵)、RoleName(UserA、Staff、Customer)。  
Customers(顧客):CustomerID(主鍵)、Name、Email、Phone、DriverLicenseNumber。  
Cars(車輛):CarID(主鍵)、LicensePlateNumber、Brand、Model、Status(可出租/租借中/保養中)、Rate。  
Rentals(租賃訂單):RentalID(主鍵)、CustomerID(外鍵)、CarID(外鍵)、StartDate、EndDate、TotalCost、Status(即將開始/進行中/已完成)。  
Payments(付款紀錄):PaymentsID(主鍵)、RentalID(外鍵)、Amount、PaymentDate、Method、Status(尚未付款/已付款)。  
