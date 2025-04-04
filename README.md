# FinalProject_G06 租車管理系統

## G06 Team Member
* [50915112 廖子科](https://github.com/LiaoZike)
* [51015107 廖玟嫻](https://github.com/vjainnegsyaa/DBMS_FinalProject)
* [51015130 林敬雅](https://github.com/vjainnegsyaa/DBMS_FinalProject)

## 簡介
隨著共享經濟的興起，越來越多人選擇租車作為短期出行的解決方案。對於平時無需長期擁有汽車的人來說，購買一輛汽車不僅需要支付數十萬元，還需負擔定期稅金、保險費、保養維修費等長期開銷。因此，當有用車需求時，租車服務成為更為經濟的選擇。
租車管理系統主要為顧客提供線上租車服務。顧客可以透過系統瀏覽可租借車輛的清單，並根據自身需求選擇適合的車輛，提前進行線上預約。當租賃日到來時，顧客只需攜帶有效身分證件與駕照正本，辦理保險與租賃契約，即可順利取車，避免因現場車輛短缺而無法提供租車的情況發生。
此外，租車公司員工可透過系統管理車輛，以及租賃訂單的管理，進一步提升顧客體驗與服務品質。


## Final Project Part I
```
題目+應用情境與使用案例+系統需求說明+完整性限制+ER Diagram及詳細說明
```

### [Final Project Part I 檔案連結](https://github.com/vjainnegsyaa/DBMS_FinalProject)
>https://github.com/vjainnegsyaa/DBMS_FinalProject


---

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

