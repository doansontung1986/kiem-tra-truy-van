-- 1. Lấy thông tin tất cả các sản phẩm đã được đặt trong một đơn đặt hàng cụ thể.
SELECT Products.product_id, Products.product_name, OrderDetails.quantity, Orders.order_date
FROM Products
INNER JOIN OrderDetails
ON OrderDetails.product_id = Products.product_id
INNER JOIN Orders
ON OrderDetails.order_id = Orders.order_id
WHERE OrderDetails.order_id = 2;

-- 2. Tính tổng số tiền trong một đơn đặt hàng cụ thể.
SELECT Orders.order_id, ROUND(SUM(Products.price * OrderDetails.quantity), 2) as 'Total Price'
FROM Products
INNER JOIN OrderDetails
ON OrderDetails.product_id = Products.product_id
INNER JOIN Orders
ON OrderDetails.order_id = Orders.order_id
WHERE OrderDetails.order_id = 1;

-- 3. Lấy danh sách các sản phẩm chưa có trong bất kỳ đơn đặt hàng nào.
SELECT Products.product_id, Products.product_name
FROM Products
LEFT JOIN OrderDetails
ON OrderDetails.product_id = Products.product_id
LEFT JOIN Orders
ON OrderDetails.order_id = Orders.order_id
WHERE Orders.order_id IS NULL;

-- 4. Đếm số lượng sản phẩm trong mỗi danh mục. (category_name, total_products)
SELECT c.category_name, COUNT(p.product_id) as total_products
FROM Categories c
INNER JOIN Products p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- 5. Tính tổng số lượng sản phẩm đã đặt bởi mỗi khách hàng (customer_name, total_products)
SELECT Customers.customer_name, COUNT(Orders.order_id) as total_products
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
INNER JOIN OrderDetails
ON OrderDetails.order_id = Orders.order_id
INNER JOIN Products
ON Products.product_id = OrderDetails.product_id
GROUP BY Customers.customer_name;

-- 6. Lấy thông tin danh mục có nhiều sản phẩm nhất (category_name, product_count)
SELECT c.category_name, COUNT(p.product_id) as product_count
FROM Categories c
INNER JOIN Products p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC
LIMIT 1;

-- 7. Tính tổng số sản phẩm đã được đặt cho mỗi danh mục (category_name, total_ordered)
SELECT Categories.category_name, COUNT(OrderDetails.order_detail_id) as total_ordered
FROM Categories
INNER JOIN Products
ON Categories.category_id = Products.category_id
INNER JOIN OrderDetails
ON OrderDetails.product_id = Products.product_id
GROUP BY Categories.category_name;

-- 8. Lấy thông tin về top 3 khách hàng có số lượng sản phẩm đặt hàng lớn nhất (customer_id, customer_name, total_ordered)
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) as total_ordered
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_ordered DESC
LIMIT 3;

-- 9. Lấy thông tin về khách hàng đã đặt hàng nhiều hơn một lần trong khoảng thời gian cụ thể từ ngày A -> ngày B (customer_id, customer_name, total_orders)
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) as total_ordered
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2023-02-01' AND '2023-10-01'
GROUP BY c.customer_id, c.customer_name
HAVING total_ordered > 1;

-- 10. Lấy thông tin về các sản phẩm đã được đặt hàng nhiều lần nhất và số lượng đơn đặt hàng tương ứng (product_id, product_name, total_ordered)
SELECT Products.product_id, Products.product_name, COUNT(Orders.order_id) as total_ordered
FROM Products
INNER JOIN OrderDetails
ON Products.product_id = OrderDetails.product_id
INNER JOIN Orders
ON OrderDetails.order_id = Orders.order_id
GROUP BY Products.product_id, Products.product_name
ORDER BY total_ordered DESC
LIMIT 1;