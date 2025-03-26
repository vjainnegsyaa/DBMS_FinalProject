# DBMS_FinalProject_G06
# Subject: 租車管理系統
● 50915112廖子科、 51015107廖玟嫻、51015130林敬雅  

● 簡介:  
租車管理系統可以讓顧客線上預約租車、查看車輛資訊並支付費用。員工負責管理車輛狀態、處理租賃訂單，確保租賃流程順暢。而系統管理員則擁有完整的管理權限，可以維護所有使用者、車輛與訂單數據。這個系統提升了租車流程的效率，讓租車變得更方便、更有條理！  

● 表格設計:  
Users(使用者):UserID(主鍵)、RoleID(外鍵)、Username、Email、Password、Phone。  
Roles(角色權限):RoleID(主鍵)、RoleName(UserA、Staff、Customer)。  
Customers(顧客):CustomerID(主鍵)、Name、Email、Phone、DriverLicenseNumber。  
Cars(車輛):CarID(主鍵)、LicensePlateNumber、Brand、Model、Status(可出租/租借中/保養中)、Rate。  
Rentals(租賃訂單):RentalID(主鍵)、CustomerID(外鍵)、CarID(外鍵)、StartDate、EndDate、TotalCost、Status(即將開始/進行中/已完成)。  
Payments(付款紀錄):PaymentsID(主鍵)、RentalID(外鍵)、Amount、PaymentDate、Method。  
  
● 使用者權限:  
| RoleName\DB | Users | Customers | Cars | Rentals | Payments |
| :---: | :---: | :---: | :---: | :---: | :---: |
| UserA | ✓ | ✓ | ✓ | ✓ | ✓ |
| Staff | ✗ | 只能查看 | 只能對資料做些改，不能新增和刪除 | ✓ | ✓ |
| Customer | ✗ | 僅限管理自己的資料 | 只能查看 | 可以新增(自行租車)，僅限管理自己的租賃訂單 | 只能查看和新增(僅限自己的訂單) |
