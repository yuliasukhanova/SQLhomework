--��� ������ � ������
CREATE OR REPLACE VIEW order_in_work AS
SELECT o.number_order, o.id 
FROM orders o, status_type st
WHERE st.id =o.status_type 
AND st.`type` = '�� ������';

--���������� ������� �� ��������
CREATE OR REPLACE VIEW cnt_order AS
SELECT o.status_type, count(*) AS total, st.type
FROM orders o
JOIN status_type st on st.id = o.status_type 
GROUP BY status_type;

--������� �� ���������� ������� ������ ����� ��������� ������� ��������
DELIMITER //

CREATE TRIGGER update_status AFTER UPDATE ON delivery
FOR EACH ROW
BEGIN
  IF (new.delivery_status='delivered') THEN UPDATE orders
  SET status_type = '��������'
WHERE id = new.order_id
END IF;
END//

DELIMITER ;