UPDATE P
   SET IsDiscontinued = 1
  FROM Product P
  LEFT JOIN OrderItem I ON P.Id = I.ProductId
 WHERE I.Id IS NULL



UPDATE I
   SET I.UnitPrice = 25
  FROM Customer C
  JOIN [Order] O ON O.CustomerId = C.Id
  JOIN OrderItem I ON O.Id = I.OrderId 
  JOIN Product P ON P.Id = I.ProductId
 WHERE C.FirstName = 'Paul' AND C.LastName = 'Henriot'
   AND P.ProductName = 'Queso Cabrales'