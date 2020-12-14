-------User---------
begin
pdb_Rattler_admin.RegistrationUser('Katya', '1234567');
end;

begin
pdb_Rattler_admin.AuthorizationUser('Katya', '1234567');
end;

begin
pdb_Rattler_admin.DeleteUser('Katya', '1234567');
end;

begin
pdb_Rattler_admin.UpdateLogin('Katyaryna', '1234567');
end;

-------Ticket---------
begin
pdb_Rattler_admin.AddTicket('Katyaryna', '1234567', 27);
end;


begin
pdb_Rattler_admin.UpdateName('Katyya', 1);
end;

begin
pdb_Rattler_admin.DeleteTicket('Katyya', 27);
end;


------Order---------

begin
pdb_Rattler_admin.AddOrder(150005, 2);
end;

begin
pdb_Rattler_admin.CancelOrder(2);
end;
