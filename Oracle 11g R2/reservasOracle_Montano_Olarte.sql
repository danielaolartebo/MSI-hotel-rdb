create table hotel (
  hotelno number(10) not null,
  hotelname varchar2(30) not null,
  city varchar2(15) not null,
  primary key (hotelno)
)/

create table guest (
  guestno number(10) not null,
  guestname varchar2(20) not null,
  guestaddress varchar2(20),
  primary key (guestno)
)/

create table room (
  roomno number(10) not null,
  hotelno number(10) not null,
  type char(6) not null,
  check (type in ('SINGLE', 'DOUBLE', 'FAMILY')),
  price number not null,
  check (roomno >= 1 and roomno <= 120),
  check (price >= 10 and price <= 100),
  primary key (roomno, hotelno),
  foreign key (hotelno) references hotel (hotelno)
)/

create table booking (
  roomno number(10) not null,
  hotelno number(10) not null,
  guestno number(10) not null,
  datefrom date not null,
  dateto date not null,
  check (roomno >= 1 and roomno <= 120),
  primary key (hotelno, guestno, datefrom),
  foreign key (roomno, hotelno) references room,
  foreign key (guestno) references guest (guestno)
)/

create trigger datecheck before insert on booking 
for each row
begin
   if (:NEW.datefrom < SYSDATE) then
    RAISE_APPLICATION_ERROR(-20100, 'Date from must be a date in the future');
  end if;
  if (:NEW.dateto < SYSDATE) then
    RAISE_APPLICATION_ERROR(-20100, 'Date to must be a date in the future');
  end if;
  if (:NEW.datefrom > :NEW.dateto) then
    RAISE_APPLICATION_ERROR(-20100, 'Date to must be greater than date from');
  end if;
end;
/

INSERT INTO Hotel VALUES(1, 'Eco Hotel Terrabella', 'Santa Elena')/
INSERT INTO Hotel VALUES(2, 'Hotel Arreboles Del Caribe', 'Arboletes')/
INSERT INTO Hotel VALUES(3, 'Hotel Brisas del Calima', 'Calima')/
INSERT INTO Hotel VALUES(4, 'Jordan Hotel Boutique', 'Guatapé')/
INSERT INTO Hotel VALUES(5, 'Sixtina Plaza Hotel', 'Itagüi')/
INSERT INTO Hotel VALUES(6, 'Villa del Mojan', 'Calera')/
INSERT INTO Hotel VALUES(7, 'Cielo en Tena', 'Tena')/
INSERT INTO Hotel VALUES(8, 'Hotel Ayenda Marckia', 'Armenia')/
INSERT INTO Hotel VALUES(9, 'Hotel Casa Azul', 'Ladrilleros')/
INSERT INTO Hotel VALUES(10, 'Hotel Bicentenario', 'Rionegro')/

INSERT INTO Guest VALUES(1, 'Amina Romero', '2833 Grove Avenue')/
INSERT INTO Guest VALUES(2, 'Damian Abreu', '349 Benedum Drive')/
INSERT INTO Guest VALUES(3, 'Xavi Acedo', '3869 Ingram Road')/
INSERT INTO Guest VALUES(4, 'Alonso Salas', '4873 Stoney Lane')/
INSERT INTO Guest VALUES(5, 'Helena Peiro', '4252 Forest Drive')/
INSERT INTO Guest VALUES(6, 'Josep Saldaña', '532 Birch Street')/
INSERT INTO Guest VALUES(7, 'June Sampedro', '1830 Bryan Street')/
INSERT INTO Guest VALUES(8, 'Claudio Benitez', '1095 Hillside Drive')/
INSERT INTO Guest VALUES(9, 'Jamila Echevarria', '3462 Clover Drive')/
INSERT INTO Guest VALUES(10, 'Bonifacio Sanz', '2769 Bartlett Avenue')/

INSERT INTO Room VALUES(1, 1, 'SINGLE', 40)/
INSERT INTO Room VALUES(1, 2, 'DOUBLE', 70)/
INSERT INTO Room VALUES(2, 3, 'FAMILY', 100)/
INSERT INTO Room VALUES(3, 3, 'SINGLE', 40)/
INSERT INTO Room VALUES(4, 4, 'DOUBLE', 70)/
INSERT INTO Room VALUES(4, 5, 'FAMILY', 100)/
INSERT INTO Room VALUES(4, 6, 'SINGLE', 40)/
INSERT INTO Room VALUES(5, 7, 'DOUBLE', 70)/
INSERT INTO Room VALUES(6, 8, 'FAMILY', 100)/
INSERT INTO Room VALUES(7, 9, 'SINGLE', 40)/

INSERT INTO Booking VALUES(1, 1, 1, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(1, 2, 2, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(2, 3, 3, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(3, 3, 4, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(4, 4, 5, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(4, 5, 6, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(4, 6, 7, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(5, 7, 8, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(6, 8, 9, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
INSERT INTO Booking VALUES(7, 9, 10, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'))/
