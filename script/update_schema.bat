REM add more migrations for db schema changes!
REM please put this bat file in folder /script/

cd ..

@echo on

echo add category_id on table orders
call rails generate migration AddCategoryRefToOrders category:references

echo add email, password, signup_time, last_signin_time, last_signin_ip,  on table users
call rails generate migration AddColumnsToUsers email:string  password:string  signup_time:datetime  last_signin_time:datetime  last_signin_ip:string password_digest:string

echo change column seller_id to buyer_id on table order_price_histories
rails generate migration RenameSeller_IdInOrderPriceHistories


echo add image_path  on table categories
call rails generate migration AddImagePathToCategories image_path:string

echo add more columns on table users
call rails generate migration AddMoreColumnsToUsers username:string contact:string contact_cellphone:string contact_tel:string contact_title:integer


echo change column password to password_digest  on table users
call rails generate migration RenamePasswordInUsers

echo remove column user_type on table users
call rails generate migration RemoveUserTypeFromUsers user_type:string 


echo change column seller_id to vendor_id  on table orders
call rails generate migration RenameSellerIdInOrders


echo add more columns on table orders
call rails generate migration AddColumnsToOrders order_num:string location_id:integer payment_method:integer currency:integer vendor_list:string


echo add more columns on table order_goods
call rails generate migration AddColumnsToOrderGoods image:binary memo:string


echo change column seller_id to vendor_id  on table order_price_histories
call rails generate migration RenameSellerIdToVendorIdInOrderPriceHistories


echo change column address to register_address  on table companies
call rails generate migration RenameAddressInCompanies


echo add more columns on table companies
call rails generate migration AddColumnsToCompanies license_image:binary account_num:string

echo add two new tables
call rails generate model Location name:string parent_id:integer  zip_code:integer
call rails generate model FollowRelationship follower_id:integer followed_id:integer


echo add the location column in order table for search
call rails generate migration AddLocationSearchableToOrders location_searchable:string


echo add two new tables
call rails generate model CategoryUnit  category:references  unit_name:string
call rails generate model CategoryPropValueList goods_prop_value:references prop_value:string

echo add memo column on table orders
call rails generate migration AddOrderMemoToOrders order_memo:string


echo add new table for vendor
call rails generate model CompanyVendor  company:references  vendor_id:integer

echo add three columns on table order_price_history
call rails generate migration AddColumnsToOrderPriceHistories delivery_days:integer bid_memo:string is_valid:boolean
 

echo add delivery_date column on table orders
call rails generate migration AddDeliveryDateToOrders delivery_date:datetime

echo add vendor_type column on table companies
call rails generate migration AddVendorTypeToCompanies vendor_type:integer


echo add payment transaction table
call rails generate model Transaction notify_id:string notify_type:string notify_time:datetime trade_no:string trade_status:integer buyer_alipay_account:string seller_alipay_account:string total_fee:decimal{8,2} discount:decimal{8,2} order:references gmt_create:datetime gmt_payment:datetime refund_status:integer gmt_refund:datetime


echo add delivery_addr column on table orders
call rails generate migration AddDeliveryAddrToOrders delivery_addr:string


echo add table for non-deal order reason
call rails generate model BidStatusReason  order:references user:references status:integer reason:integer


echo  ----- finished changes ----
pause