

grant execute on dbms_crypto to pdb_Rattler_admin with grant option;
grant execute on dbms_hm to pdb_Rattler_admin with grant option;


create role RL_Rattler_user;
 begin
CheckUser('Katya', 'qwer');
 end;