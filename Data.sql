-- Insertar un cliente con todos los campos especificados
INSERT INTO [dbo].[customer] ([ci], [name], [surname], [second_sur_name], [email], [phone], [created_by], [updated_by], [last_update], [is_active], [creation_date])
VALUES ('1234567890', 'Juan', 'Pérez', 'González', 'juan@example.com', '123456789', 1, NULL, NULL, 1, GETDATE());

INSERT INTO [dbo].[customer] ([ci], [name], [surname], [second_sur_name], [email], [phone], [created_by], [updated_by], [last_update], [is_active], [creation_date])
VALUES ('9876543210', 'María', 'López', 'Martínez', 'maria@example.com', '987654321', 1, NULL, NULL, 1, GETDATE());

INSERT INTO [dbo].[customer] ([ci], [name], [surname], [second_sur_name], [email], [phone], [created_by], [updated_by], [last_update], [is_active], [creation_date])
VALUES ('5678901234', 'Carlos', 'Rodríguez', NULL, 'carlos@example.com', '567890123', 1, NULL, NULL, 1, GETDATE());

INSERT INTO [dbo].[customer] ([ci], [name], [surname], [second_sur_name], [email], [phone], [created_by], [updated_by], [last_update], [is_active], [creation_date])
VALUES ('3456789012', 'Laura', 'Gómez', 'Fernández', NULL, '345678901', 1, NULL, NULL, 1, GETDATE());

INSERT INTO [dbo].[customer] ([ci], [name], [surname], [second_sur_name], [email], [phone], [created_by], [updated_by], [last_update], [is_active], [creation_date])
VALUES ('9012345678', 'Pedro', 'Martínez', 'Sánchez', 'pedro@example.com', '901234567', 1, NULL, NULL, 1, GETDATE());
