prompt PL/SQL Developer import file
prompt Created on 2018��6��16�� by Administrator
set feedback off
set define off
prompt Creating ADEEXES...
create table ADEEXES
(
  ADEEXESID   NUMBER(11) not null,
  ADEEXESNAME VARCHAR2(20),
  ADEEXESEG   VARCHAR2(11),
  KUAIJI      VARCHAR2(20),
  REMARKS     VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADEEXES
  add primary key (ADEEXESID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating APPORTIONDETAILS...
create table APPORTIONDETAILS
(
  DETAILSID   NUMBER(11) not null,
  ADEEXESID   VARCHAR2(20),
  ADEID       VARCHAR2(20),
  MONEYTYPEID VARCHAR2(20),
  ADEAMTMONEY NUMBER(11,4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPORTIONDETAILS
  add primary key (DETAILSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating APPORTIONRESULT...
create table APPORTIONRESULT
(
  RESULTID      NUMBER(38) not null,
  BILLNO        VARCHAR2(20),
  PURCHASENO    VARCHAR2(20),
  PURCHASEMONEY NUMBER(38,4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPORTIONRESULT
  add primary key (RESULTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DEPART...
create table DEPART
(
  DEPARTID   NUMBER(8) not null,
  DEPARTNAME VARCHAR2(20),
  ENGNAME    VARCHAR2(30),
  MEMO       VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DEPART
  is '�����趨��';
comment on column DEPART.DEPARTID
  is '���ű��';
comment on column DEPART.DEPARTNAME
  is '��������';
comment on column DEPART.ENGNAME
  is 'Ӣ������';
comment on column DEPART.MEMO
  is '��ע';
alter table DEPART
  add primary key (DEPARTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DOCUMENT_OFTYPE...
create table DOCUMENT_OFTYPE
(
  DOCUMENT_TYPE     VARCHAR2(20),
  DOCUMENT_TYPEID   NUMBER not null,
  DOCUMENT_TYPENAME VARCHAR2(20),
  MEMO              VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DOCUMENT_OFTYPE
  is '���������趨��';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPE
  is '��Դ����';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPEID
  is '���ͱ��';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPENAME
  is '��������';
comment on column DOCUMENT_OFTYPE.MEMO
  is '��ע';
alter table DOCUMENT_OFTYPE
  add primary key (DOCUMENT_TYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating D_TYPE...
create table D_TYPE
(
  ID       NUMBER(10) not null,
  TYPENAME VARCHAR2(50) not null,
  ENAME    VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column D_TYPE.ID
  is '�������';
comment on column D_TYPE.TYPENAME
  is '������������';
comment on column D_TYPE.ENAME
  is 'Ӣ������';
alter table D_TYPE
  add constraint SSDASD primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MONEYTYPE...
create table MONEYTYPE
(
  MONEYID   NUMBER(11) not null,
  MONEYNAME VARCHAR2(20),
  MONEYEG   VARCHAR2(11),
  ER        NUMBER(38,4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MONEYTYPE
  add primary key (MONEYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating NAME...
create table NAME
(
  NAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASE_RETURN...
create table PURCHASE_RETURN
(
  ODD_NUMBERS    VARCHAR2(50) not null,
  TIME           VARCHAR2(50) not null,
  DTYPEID        NUMBER(10) not null,
  SUPPLIERSID    VARCHAR2(50) not null,
  SAID           VARCHAR2(50) not null,
  ADDRESS        VARCHAR2(50) not null,
  TAXNO          NUMBER(2) not null,
  STOREHOUSE     VARCHAR2(50) not null,
  NO_AGAIN       NUMBER(2) not null,
  CURRENCY       VARCHAR2(50) default 'RMB' not null,
  CURRENCYRATE   NUMBER(10,2) default 1.00 not null,
  EXCHANGE_RATE  NUMBER(2) not null,
  PURCHASE_HUMAN VARCHAR2(50) not null,
  TOUCHING_HUMAN VARCHAR2(50) not null,
  DEPARTMENT     VARCHAR2(50) not null,
  CHECK_HUMAN    VARCHAR2(50) not null,
  PROJECT        VARCHAR2(50) not null,
  NO_EXAMINE     NUMBER(2) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column PURCHASE_RETURN.ODD_NUMBERS
  is '''���ݱ��''';
comment on column PURCHASE_RETURN.TIME
  is '''��������''';
comment on column PURCHASE_RETURN.DTYPEID
  is '''��������ID';
comment on column PURCHASE_RETURN.SUPPLIERSID
  is '''��Ӧ�̱��';
comment on column PURCHASE_RETURN.SAID
  is '''��Ӧ�̵�ַ���''';
comment on column PURCHASE_RETURN.ADDRESS
  is '''��Ӧ�̵�ַ''';
comment on column PURCHASE_RETURN.TAXNO
  is '''�����Ƿ�˰(0��1��)''';
comment on column PURCHASE_RETURN.STOREHOUSE
  is '''�ֿ�''';
comment on column PURCHASE_RETURN.NO_AGAIN
  is '''�Ƿ��������(0��1��)''';
comment on column PURCHASE_RETURN.CURRENCY
  is '''����''';
comment on column PURCHASE_RETURN.CURRENCYRATE
  is '''����''';
comment on column PURCHASE_RETURN.EXCHANGE_RATE
  is '''����ó��(0��1��)''';
comment on column PURCHASE_RETURN.PURCHASE_HUMAN
  is '''�ɹ���Ա''';
comment on column PURCHASE_RETURN.TOUCHING_HUMAN
  is '''�Ƶ���Ա''';
comment on column PURCHASE_RETURN.DEPARTMENT
  is '''��������''';
comment on column PURCHASE_RETURN.CHECK_HUMAN
  is '''������Ա''';
comment on column PURCHASE_RETURN.PROJECT
  is '''������Ŀ''';
comment on column PURCHASE_RETURN.NO_EXAMINE
  is '''�Ƿ����(0δ��ˣ�1�����)''';
alter table PURCHASE_RETURN
  add primary key (ODD_NUMBERS)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASE_RETURN_DETAIL...
create table PURCHASE_RETURN_DETAIL
(
  DTYPEID              NUMBER(2) not null,
  ODD_NUMBERS          VARCHAR2(50) not null,
  ID                   NUMBER(10) not null,
  MATTERID             VARCHAR2(50) not null,
  MATTERNAME           VARCHAR2(50) not null,
  SPECIFICATIONS_MODEL VARCHAR2(50) not null,
  UNIT                 VARCHAR2(50) not null,
  QUANTITY             NUMBER(20) not null,
  FRONT_UNIT_PRICE     NUMBER(20,2) not null,
  BROKEN_NUMBER        NUMBER(20,2) not null,
  UNIT_PRICE           NUMBER(20,2) not null,
  AMOUNT               NUMBER(20,2) not null,
  TAX_RATE             NUMBER(20,2) not null,
  TAX_LIMIT            NUMBER(20,2) not null,
  GIFT                 NUMBER(2) default 0 not null,
  ADD_TAX_AMOUNT       NUMBER(20,2) not null,
  SOURCE_TYPE          VARCHAR2(50) not null,
  SOURCE_ODD_NUMBERS   VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column PURCHASE_RETURN_DETAIL.DTYPEID
  is '''��������ID';
comment on column PURCHASE_RETURN_DETAIL.ODD_NUMBERS
  is '''���ݱ��''';
comment on column PURCHASE_RETURN_DETAIL.ID
  is '''�к�''';
comment on column PURCHASE_RETURN_DETAIL.MATTERID
  is '''���ϱ��''';
comment on column PURCHASE_RETURN_DETAIL.MATTERNAME
  is '''��������''';
comment on column PURCHASE_RETURN_DETAIL.SPECIFICATIONS_MODEL
  is '''����ͺ�''';
comment on column PURCHASE_RETURN_DETAIL.UNIT
  is '''��λ''';
comment on column PURCHASE_RETURN_DETAIL.QUANTITY
  is '''����''';
comment on column PURCHASE_RETURN_DETAIL.FRONT_UNIT_PRICE
  is '''�ۿ�ǰ����''';
comment on column PURCHASE_RETURN_DETAIL.BROKEN_NUMBER
  is '''����''';
comment on column PURCHASE_RETURN_DETAIL.UNIT_PRICE
  is '''����''';
comment on column PURCHASE_RETURN_DETAIL.AMOUNT
  is '''���''';
comment on column PURCHASE_RETURN_DETAIL.TAX_RATE
  is '''˰��''';
comment on column PURCHASE_RETURN_DETAIL.TAX_LIMIT
  is '''˰��''';
comment on column PURCHASE_RETURN_DETAIL.GIFT
  is '''�Ƿ���Ʒ��0��1�ǣ�''';
comment on column PURCHASE_RETURN_DETAIL.ADD_TAX_AMOUNT
  is '''��˰���''';
comment on column PURCHASE_RETURN_DETAIL.SOURCE_TYPE
  is '''��Դ����''';
comment on column PURCHASE_RETURN_DETAIL.SOURCE_ODD_NUMBERS
  is '''��Դ����''';
alter table PURCHASE_RETURN_DETAIL
  add primary key (ID, ODD_NUMBERS)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASING_TOWARE...
create table PURCHASING_TOWARE
(
  BILLNO      VARCHAR2(20) not null,
  BILLDATE    DATE,
  GUSTID      VARCHAR2(20),
  ADDRID      VARCHAR2(20),
  SALECLASSID NUMBER,
  CURRID      VARCHAR2(20),
  PRICEOFTAX  VARCHAR2(20),
  EXCHRATE    NUMBER,
  WAREID      VARCHAR2(20),
  SALEID      VARCHAR2(20),
  DEPARTID    VARCHAR2(20),
  MAKER       VARCHAR2(20),
  PERMITTER   VARCHAR2(20),
  PROJECTID   VARCHAR2(20),
  MEMO        VARCHAR2(200),
  ISPERMITTER NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PURCHASING_TOWARE
  is '�ɹ���ⵥ����';
comment on column PURCHASING_TOWARE.BILLNO
  is '���ݺ���';
comment on column PURCHASING_TOWARE.BILLDATE
  is '��������';
comment on column PURCHASING_TOWARE.GUSTID
  is '��Ӧ��';
comment on column PURCHASING_TOWARE.ADDRID
  is '��Ӧ�̵�ַ';
comment on column PURCHASING_TOWARE.SALECLASSID
  is '�ɹ��������';
comment on column PURCHASING_TOWARE.CURRID
  is '�ұ�';
comment on column PURCHASING_TOWARE.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column PURCHASING_TOWARE.EXCHRATE
  is '����';
comment on column PURCHASING_TOWARE.WAREID
  is '�ֿ�';
comment on column PURCHASING_TOWARE.SALEID
  is '�ɹ���Ա';
comment on column PURCHASING_TOWARE.DEPARTID
  is '��������';
comment on column PURCHASING_TOWARE.MAKER
  is '�Ƶ���Ա';
comment on column PURCHASING_TOWARE.PERMITTER
  is '������Ա';
comment on column PURCHASING_TOWARE.PROJECTID
  is '������Ŀ';
comment on column PURCHASING_TOWARE.MEMO
  is '��ע';
comment on column PURCHASING_TOWARE.ISPERMITTER
  is '���״̬0δ��ˣ�1�����';
alter table PURCHASING_TOWARE
  add primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASING_TOWARE_DETAILS...
create table PURCHASING_TOWARE_DETAILS
(
  SERNO      NUMBER(8) not null,
  BILLID     VARCHAR2(20),
  PRODID     VARCHAR2(20),
  PRODNAME   VARCHAR2(20),
  PRODSIZE   VARCHAR2(20),
  STDUNITID  VARCHAR2(20),
  SQUANTITY  NUMBER,
  OLDPRICE   NUMBER(6,2),
  DISCOUNT   NUMBER(6,2),
  SPRICE     NUMBER(6,2),
  AMOUNT     NUMBER(7,2),
  TAXRATE    NUMBER(6,2),
  TAXAMT     NUMBER(6,2),
  AMOUNTATAX NUMBER(7,2),
  BATCHID    NUMBER,
  ISGIFT     NUMBER,
  FROMTYPE   NUMBER,
  FROMNO     VARCHAR2(20),
  MLAOUNT    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PURCHASING_TOWARE_DETAILS
  is '�ɹ���ⵥ���ݱ�';
comment on column PURCHASING_TOWARE_DETAILS.SERNO
  is '����';
comment on column PURCHASING_TOWARE_DETAILS.BILLID
  is '�ɹ���ⵥ���';
comment on column PURCHASING_TOWARE_DETAILS.PRODID
  is '���ϱ��';
comment on column PURCHASING_TOWARE_DETAILS.PRODSIZE
  is '��������';
comment on column PURCHASING_TOWARE_DETAILS.STDUNITID
  is '����ͺ�';
comment on column PURCHASING_TOWARE_DETAILS.SQUANTITY
  is '��λ����';
comment on column PURCHASING_TOWARE_DETAILS.OLDPRICE
  is '����';
comment on column PURCHASING_TOWARE_DETAILS.DISCOUNT
  is '�ۿ�ǰ����';
comment on column PURCHASING_TOWARE_DETAILS.SPRICE
  is '����';
comment on column PURCHASING_TOWARE_DETAILS.AMOUNT
  is '����';
comment on column PURCHASING_TOWARE_DETAILS.TAXRATE
  is '���';
comment on column PURCHASING_TOWARE_DETAILS.TAXAMT
  is '˰��';
comment on column PURCHASING_TOWARE_DETAILS.AMOUNTATAX
  is '��˰���';
comment on column PURCHASING_TOWARE_DETAILS.BATCHID
  is '����';
comment on column PURCHASING_TOWARE_DETAILS.ISGIFT
  is '��Ʒ';
comment on column PURCHASING_TOWARE_DETAILS.FROMTYPE
  is '��Դ����';
comment on column PURCHASING_TOWARE_DETAILS.FROMNO
  is '��Դ����';
comment on column PURCHASING_TOWARE_DETAILS.MLAOUNT
  is '��̯����';
alter table PURCHASING_TOWARE_DETAILS
  add primary key (SERNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PURCHASING_TOWARE_DETAILS
  add constraint FK_PERMITTER foreign key (BILLID)
  references PURCHASING_TOWARE (BILLNO);

prompt Creating STAFF_MASTER_FILE...
create table STAFF_MASTER_FILE
(
  STAFFID             VARCHAR2(20) not null,
  DEPARTMENTID        NUMBER,
  STAFFNAME           VARCHAR2(20),
  SEX                 VARCHAR2(20),
  STAFFEN_NAME        VARCHAR2(30),
  IDCARD              VARCHAR2(20),
  BIRTHDAY            DATE,
  POLITICS_STATUS     VARCHAR2(20),
  MARRIAGE_STATUS     NUMBER,
  INDUCTION_DATE      DATE,
  BLOOD_GROUP         VARCHAR2(10),
  REGULAR_WORKER_DATE DATE,
  NATIVE_PLACE        VARCHAR2(20),
  QUALIFYING_PERIOD   VARCHAR2(20),
  NATIONALITY         VARCHAR2(20),
  LEAVE_OFFICE_DATE   DATE,
  NATION              VARCHAR2(20),
  TECHNICAL_TITLE     VARCHAR2(20),
  CN_DUTIES           VARCHAR2(20),
  EN_DUTIES           VARCHAR2(20),
  LINKPOSTCODE        VARCHAR2(20),
  LINKADDRESS         VARCHAR2(50),
  LINKPHONE           VARCHAR2(20),
  PHONE               VARCHAR2(20),
  HIGHEST_EDUCATION   VARCHAR2(20),
  EXPIRATION_DATE     DATE,
  BACHELOR_DEGREE     VARCHAR2(20),
  ARRIVAL_DATE        DATE,
  GRADUATE            VARCHAR2(20),
  PASSPORT_NUMBER     VARCHAR2(20),
  COLLEGE_MAJOR       VARCHAR2(20),
  PACT_START_DATE     DATE,
  EXPERIENCES_DATE    DATE,
  EMAIL               VARCHAR2(50),
  CONTRACT_PERIOD     DATE,
  NOW_PHONE           VARCHAR2(20),
  DOMICILE_PHONE      VARCHAR2(20),
  NOW_POSTCODE        VARCHAR2(30),
  DOMICILE_POSTCODE   VARCHAR2(20),
  NOW_ADDRESS         VARCHAR2(30),
  EMERGENCY_LINKMAN   VARCHAR2(20),
  HOME_PHONE          VARCHAR2(20),
  EMERGENCY_POSTCODE  VARCHAR2(30),
  EMERGENCY_LINKPHONE VARCHAR2(20),
  HOME_ADDRESS        VARCHAR2(30),
  EMERGENCY_ADDRESS   VARCHAR2(30),
  REMARK              VARCHAR2(200),
  STANDBY_1           VARCHAR2(200),
  STANDBY_2           VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table STAFF_MASTER_FILE
  is '��Ա���ļ��趨��';
comment on column STAFF_MASTER_FILE.STAFFID
  is '��Ա���';
comment on column STAFF_MASTER_FILE.DEPARTMENTID
  is '��������';
comment on column STAFF_MASTER_FILE.STAFFNAME
  is '��Ա����';
comment on column STAFF_MASTER_FILE.SEX
  is '�Ա�';
comment on column STAFF_MASTER_FILE.STAFFEN_NAME
  is 'Ӣ������';
comment on column STAFF_MASTER_FILE.IDCARD
  is '���֤��';
comment on column STAFF_MASTER_FILE.BIRTHDAY
  is '��������';
comment on column STAFF_MASTER_FILE.POLITICS_STATUS
  is '������ò';
comment on column STAFF_MASTER_FILE.MARRIAGE_STATUS
  is '����״̬';
comment on column STAFF_MASTER_FILE.INDUCTION_DATE
  is '��ְ����';
comment on column STAFF_MASTER_FILE.BLOOD_GROUP
  is 'Ѫ��';
comment on column STAFF_MASTER_FILE.REGULAR_WORKER_DATE
  is 'ת������';
comment on column STAFF_MASTER_FILE.NATIVE_PLACE
  is '����';
comment on column STAFF_MASTER_FILE.QUALIFYING_PERIOD
  is '�����ڳ�';
comment on column STAFF_MASTER_FILE.NATIONALITY
  is '����';
comment on column STAFF_MASTER_FILE.LEAVE_OFFICE_DATE
  is '��ְ����';
comment on column STAFF_MASTER_FILE.NATION
  is '����';
comment on column STAFF_MASTER_FILE.TECHNICAL_TITLE
  is '����ְ��';
comment on column STAFF_MASTER_FILE.CN_DUTIES
  is '����ְ��';
comment on column STAFF_MASTER_FILE.EN_DUTIES
  is 'Ӣ��ְ��';
comment on column STAFF_MASTER_FILE.LINKPOSTCODE
  is '��ϵ�ʱ�';
comment on column STAFF_MASTER_FILE.LINKADDRESS
  is '��ϵ��ַ';
comment on column STAFF_MASTER_FILE.LINKPHONE
  is '��ϵ�绰';
comment on column STAFF_MASTER_FILE.PHONE
  is '�ƶ��绰';
comment on column STAFF_MASTER_FILE.HIGHEST_EDUCATION
  is '���ѧ��';
comment on column STAFF_MASTER_FILE.EXPIRATION_DATE
  is '��������';
comment on column STAFF_MASTER_FILE.GRADUATE
  is '��ҵѧУ';
comment on column STAFF_MASTER_FILE.PASSPORT_NUMBER
  is '���պ���';
comment on column STAFF_MASTER_FILE.COLLEGE_MAJOR
  is '��ѧרҵ';
comment on column STAFF_MASTER_FILE.PACT_START_DATE
  is '��ͬ��ʼ����';
comment on column STAFF_MASTER_FILE.EXPERIENCES_DATE
  is '��������';
comment on column STAFF_MASTER_FILE.EMAIL
  is '�����ʼ�';
comment on column STAFF_MASTER_FILE.CONTRACT_PERIOD
  is '��ͬ�ڣ�����';
comment on column STAFF_MASTER_FILE.NOW_PHONE
  is '�ֵ绰';
comment on column STAFF_MASTER_FILE.DOMICILE_PHONE
  is '�����绰';
comment on column STAFF_MASTER_FILE.NOW_POSTCODE
  is '���ʱ�';
comment on column STAFF_MASTER_FILE.NOW_ADDRESS
  is '�ֵ�ַ';
comment on column STAFF_MASTER_FILE.EMERGENCY_LINKMAN
  is '������ϵ��';
comment on column STAFF_MASTER_FILE.HOME_PHONE
  is '��ͥ�绰';
comment on column STAFF_MASTER_FILE.EMERGENCY_POSTCODE
  is '������ϵ�ʱ�';
comment on column STAFF_MASTER_FILE.EMERGENCY_LINKPHONE
  is '������ϵ�绰';
comment on column STAFF_MASTER_FILE.HOME_ADDRESS
  is '  ��ͥ��ַ';
comment on column STAFF_MASTER_FILE.EMERGENCY_ADDRESS
  is '������ϵ��ַ';
comment on column STAFF_MASTER_FILE.REMARK
  is '��ע';
comment on column STAFF_MASTER_FILE.STANDBY_1
  is '������1';
comment on column STAFF_MASTER_FILE.STANDBY_2
  is '������2';
alter table STAFF_MASTER_FILE
  add primary key (STAFFID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STAFF_MASTER_FILE
  add constraint FK_DEPARTMENTID foreign key (DEPARTMENTID)
  references DEPART (DEPARTID);

prompt Creating STOCKAPPRTION...
create table STOCKAPPRTION
(
  APPID       VARCHAR2(20) not null,
  APPDATE     VARCHAR2(20),
  WISID       NUMBER(11),
  APPAMTMONEY VARCHAR2(20),
  MAKEPERSON  VARCHAR2(20),
  STAFFID     VARCHAR2(20),
  ESTATEDATE  VARCHAR2(20),
  ESTATE      VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STOCKAPPRTION
  add primary key (APPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIERS...
create table SUPPLIERS
(
  SID               VARCHAR2(50) not null,
  STID              VARCHAR2(50) not null,
  FUNDSATTRIBNAME   VARCHAR2(50) not null,
  FULLNAME          VARCHAR2(50) not null,
  SHORTNAME         VARCHAR2(50) not null,
  PERSONNID         VARCHAR2(50) not null,
  ENGFULLNAME       VARCHAR2(50),
  ENGSHORTNAME      VARCHAR2(50),
  CURRENCYID        VARCHAR2(50) default 'RMB' not null,
  CURRENCYRATE      NUMBER(10,2) default 1 not null,
  TAXNO             NUMBER(2) default 0 not null,
  CREDITRATING      VARCHAR2(50) default 'A' not null,
  AMOUNTQUOTA       VARCHAR2(50),
  REMAINQUOTA       NUMBER(20,2) default 0 not null,
  STARTADVRECV      NUMBER(20,2) default 0 not null,
  STARTRECEIVABLE   NUMBER(20,2) default 0 not null,
  CURADVRECV        NUMBER(20,2) default 0 not null,
  CURRECEIVABLE     NUMBER(20,2) default 0 not null,
  AREA              VARCHAR2(50),
  PRINCIPAL         VARCHAR2(50),
  TELEPHONE         VARCHAR2(50),
  TELEPHONE1        VARCHAR2(50),
  TELEPHONE2        VARCHAR2(50),
  TELEPHONE3        VARCHAR2(50),
  MOBILE_TELEPHONE  VARCHAR2(50),
  BANK_ACCOUNT      VARCHAR2(50),
  BANK_OF_DEPOSIT   VARCHAR2(50),
  PORTRAITURE       VARCHAR2(50),
  URL               VARCHAR2(50),
  MAIL_BOX          VARCHAR2(50),
  TRADE             VARCHAR2(50),
  AMOUNT_OF_CAPITAL VARCHAR2(50),
  TAX_REGISTRATION  VARCHAR2(50),
  PRIME1            DATE,
  PRIME2            DATE,
  RECENTLY1         DATE,
  RECENTLY2         DATE,
  MARKET_DAY        DATE,
  TERM_OF_PAYMENT   VARCHAR2(50),
  PAYMENT           VARCHAR2(50),
  FARE_TICKET_TYPE  VARCHAR2(50),
  MONTHLY           VARCHAR2(50),
  NO_MONEY          VARCHAR2(50),
  SUBJECT1          VARCHAR2(50),
  SUBJECT2          VARCHAR2(50),
  SUBJECT3          VARCHAR2(50),
  REMARKS           VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SUPPLIERS.SID
  is '��Ӧ�̱��';
comment on column SUPPLIERS.STID
  is '�����';
comment on column SUPPLIERS.FUNDSATTRIBNAME
  is '�˿����';
comment on column SUPPLIERS.FULLNAME
  is '��Ӧ��ȫ��';
comment on column SUPPLIERS.SHORTNAME
  is '��Ӧ�̼��';
comment on column SUPPLIERS.PERSONNID
  is '�ɹ���Ա';
comment on column SUPPLIERS.ENGFULLNAME
  is 'Ӣ��ȫ��';
comment on column SUPPLIERS.ENGSHORTNAME
  is 'Ӣ�ļ��';
comment on column SUPPLIERS.CURRENCYID
  is '����';
comment on column SUPPLIERS.CURRENCYRATE
  is '����';
comment on column SUPPLIERS.TAXNO
  is '�����Ƿ�˰';
comment on column SUPPLIERS.CREDITRATING
  is '���õȼ�';
comment on column SUPPLIERS.AMOUNTQUOTA
  is '�˿���';
comment on column SUPPLIERS.REMAINQUOTA
  is 'ʣ����';
comment on column SUPPLIERS.STARTADVRECV
  is '�ڳ�Ԥ����';
comment on column SUPPLIERS.STARTRECEIVABLE
  is '�ڳ�Ӧ����';
comment on column SUPPLIERS.CURADVRECV
  is '��ĩԤ����';
comment on column SUPPLIERS.CURRECEIVABLE
  is '��ĩӦ����';
comment on column SUPPLIERS.AREA
  is '����';
comment on column SUPPLIERS.PRINCIPAL
  is '������';
comment on column SUPPLIERS.TELEPHONE
  is '��ϵ��';
comment on column SUPPLIERS.TELEPHONE1
  is '��ϵ�绰1';
comment on column SUPPLIERS.TELEPHONE2
  is '��ϵ�绰2';
comment on column SUPPLIERS.TELEPHONE3
  is '��ϵ�绰3';
comment on column SUPPLIERS.MOBILE_TELEPHONE
  is '�ƶ��绰';
comment on column SUPPLIERS.BANK_ACCOUNT
  is '�����˺�';
comment on column SUPPLIERS.BANK_OF_DEPOSIT
  is '��������';
comment on column SUPPLIERS.PORTRAITURE
  is '�������';
comment on column SUPPLIERS.URL
  is '��ַ';
comment on column SUPPLIERS.MAIL_BOX
  is '��������';
comment on column SUPPLIERS.TRADE
  is '��ҵ��';
comment on column SUPPLIERS.AMOUNT_OF_CAPITAL
  is '�ʱ���';
comment on column SUPPLIERS.TAX_REGISTRATION
  is '˰��ǼǺ�';
comment on column SUPPLIERS.PRIME1
  is '����ɹ������';
comment on column SUPPLIERS.PRIME2
  is '����ɹ��˻���';
comment on column SUPPLIERS.RECENTLY1
  is '����ɹ������';
comment on column SUPPLIERS.RECENTLY2
  is '����ɹ��˻���';
comment on column SUPPLIERS.MARKET_DAY
  is '��ֹ������';
comment on column SUPPLIERS.TERM_OF_PAYMENT
  is '��������';
comment on column SUPPLIERS.PAYMENT
  is '��������';
comment on column SUPPLIERS.FARE_TICKET_TYPE
  is '��Ʊ����';
comment on column SUPPLIERS.MONTHLY
  is 'ÿ�½�����';
comment on column SUPPLIERS.NO_MONEY
  is 'δ��Ʊ���';
comment on column SUPPLIERS.SUBJECT1
  is 'Ԥ���˿��Ŀ';
comment on column SUPPLIERS.SUBJECT2
  is 'Ӧ���˿��Ŀ';
comment on column SUPPLIERS.SUBJECT3
  is 'Ӧ���ݹ���Ŀ';
comment on column SUPPLIERS.REMARKS
  is '��ע';
alter table SUPPLIERS
  add primary key (SID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIERS_ACCOUNT_DETAIL...
create table SUPPLIERS_ACCOUNT_DETAIL
(
  DTYPEID        NUMBER(10) not null,
  ODD_NUMBERS    VARCHAR2(50) not null,
  ID             NUMBER(10) not null,
  SUPPLIERDID    VARCHAR2(50) not null,
  TIME           DATE not null,
  PRIMARY_METALS NUMBER(20,2) not null,
  PRESENT_METALS NUMBER(20,2) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column SUPPLIERS_ACCOUNT_DETAIL.DTYPEID
  is '''��������ID';
comment on column SUPPLIERS_ACCOUNT_DETAIL.ODD_NUMBERS
  is '''����''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.ID
  is '''�к�''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.SUPPLIERDID
  is '��Ӧ�̱��';
comment on column SUPPLIERS_ACCOUNT_DETAIL.TIME
  is '''����''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.PRIMARY_METALS
  is '''ԭ�����''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.PRESENT_METALS
  is '''�������''';
alter table SUPPLIERS_ACCOUNT_DETAIL
  add primary key (ID, SUPPLIERDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIERS_ADDRESS...
create table SUPPLIERS_ADDRESS
(
  SAID            VARCHAR2(50) not null,
  SID             VARCHAR2(50) not null,
  ADDRESS         VARCHAR2(50) not null,
  REMARKS         VARCHAR2(50) not null,
  ZIP_CODE        VARCHAR2(50),
  CONTACTS        VARCHAR2(50),
  CONTACTS_TITLES VARCHAR2(50),
  TELEPHONE       VARCHAR2(50),
  PORTRAITURE     VARCHAR2(50),
  ROUTE           VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SUPPLIERS_ADDRESS.SAID
  is '''��ַ���''';
comment on column SUPPLIERS_ADDRESS.SID
  is '''��Ӧ�̱��''';
comment on column SUPPLIERS_ADDRESS.ADDRESS
  is '''��ַ''';
comment on column SUPPLIERS_ADDRESS.REMARKS
  is '''��ע''';
comment on column SUPPLIERS_ADDRESS.ZIP_CODE
  is '��������';
comment on column SUPPLIERS_ADDRESS.CONTACTS
  is '��ϵ��';
comment on column SUPPLIERS_ADDRESS.CONTACTS_TITLES
  is '��ϵ��ְ��';
comment on column SUPPLIERS_ADDRESS.TELEPHONE
  is '��ϵ�绰';
comment on column SUPPLIERS_ADDRESS.PORTRAITURE
  is '�������';
comment on column SUPPLIERS_ADDRESS.ROUTE
  is '����·��';
alter table SUPPLIERS_ADDRESS
  add primary key (SAID, SID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIERS_TYPE...
create table SUPPLIERS_TYPE
(
  STID      VARCHAR2(50) not null,
  MEMO      VARCHAR2(50) not null,
  ENGNAME   VARCHAR2(50) not null,
  CLASSNAME VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column SUPPLIERS_TYPE.STID
  is '''�����''';
comment on column SUPPLIERS_TYPE.MEMO
  is '''��ע''';
comment on column SUPPLIERS_TYPE.ENGNAME
  is '''Ӣ������''';
comment on column SUPPLIERS_TYPE.CLASSNAME
  is '''�������''';
alter table SUPPLIERS_TYPE
  add primary key (STID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating S_WATER_METER...
create table S_WATER_METER
(
  ID      VARCHAR2(50) not null,
  TIME    DATE not null,
  RMB_SHU NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column S_WATER_METER.ID
  is '�������';
comment on column S_WATER_METER.TIME
  is '����';
comment on column S_WATER_METER.RMB_SHU
  is 'Ӧ������';
alter table S_WATER_METER
  add constraint XCZXCZXCZX primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_CUSTOM_CLASS...
create table T_CUSTOM_CLASS
(
  CLASSID    VARCHAR2(20) not null,
  CLASSNAME  VARCHAR2(20),
  ENGNAME    VARCHAR2(20),
  REMARK     VARCHAR2(100),
  NEW_COLUMN INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_CUSTOM_CLASS
  is '�ͻ����';
comment on column T_CUSTOM_CLASS.CLASSID
  is '�ͻ������';
comment on column T_CUSTOM_CLASS.CLASSNAME
  is '�ͻ��������';
comment on column T_CUSTOM_CLASS.ENGNAME
  is 'Ӣ������';
comment on column T_CUSTOM_CLASS.REMARK
  is '��ע';
alter table T_CUSTOM_CLASS
  add constraint PK_CU_CL_1 primary key (CLASSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_CUSTOMER...
create table T_CUSTOMER
(
  CUSTID               VARCHAR2(20) not null,
  FUNDSATTRIBUTION     VARCHAR2(50),
  FULLNAME             VARCHAR2(50),
  CLASSID              VARCHAR2(20) not null,
  CUSTOMERABBREVIATION VARCHAR2(20),
  AREANAME             VARCHAR2(20),
  ENGFULLNAME          VARCHAR2(20),
  CURRENCYNAME         VARCHAR2(20),
  CHIEFID              VARCHAR2(20),
  PERSONID             VARCHAR2(20),
  LINKMANID            VARCHAR2(20),
  TELEPHONE            VARCHAR2(20),
  CAPITALIZATION       NUMBER(10,7),
  ENGSHORNAME          VARCHAR2(20),
  EMAIL                VARCHAR2(20),
  MOBILETEL            VARCHAR2(20),
  WEBADDRESS           VARCHAR2(20),
  BANKACCOUNT          VARCHAR2(20),
  FAXNO                VARCHAR2(20),
  BANKNAME             VARCHAR2(20),
  RATEOFDISCOUNT       NUMBER(10,7),
  PRICERANK            VARCHAR2(20),
  PRICEOFTAX           VARCHAR2(20),
  BUILDUPDATE          DATE,
  LASTVISITDATE        DATE,
  BOOKVISITDATE        DATE,
  INVALIDDATE          DATE,
  AMOUNTQUOTA          NUMBER(10,7),
  REMAINQUATA          NUMBER(10,7),
  RECRWAY              VARCHAR2(20),
  RECEIVABLES          NUMBER,
  DAYOFCLOSE           NUMBER,
  CREDITLEVEL          VARCHAR2(20),
  INVOTYPENAME         VARCHAR2(20),
  ACCRECEIVABLE        VARCHAR2(20),
  STARTADVRECV         NUMBER(10,7),
  STARTRECEIVABLE      NUMBER(10,7),
  CURADVRECV           NUMBER(10,7),
  CURRECEIVABLE        NUMBER(10,7),
  NOTINVQUOTA          NUMBER(10,7),
  ACCADVRECV           VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_CUSTOMER.CUSTID
  is '�ͻ����';
comment on column T_CUSTOMER.FUNDSATTRIBUTION
  is '�˿����';
comment on column T_CUSTOMER.FULLNAME
  is '�ͻ�ȫ��';
comment on column T_CUSTOMER.CLASSID
  is '�����';
comment on column T_CUSTOMER.CUSTOMERABBREVIATION
  is '�ͻ����';
comment on column T_CUSTOMER.AREANAME
  is '����';
comment on column T_CUSTOMER.ENGFULLNAME
  is 'Ӣ��ȫ��';
comment on column T_CUSTOMER.CURRENCYNAME
  is '�ұ�����';
comment on column T_CUSTOMER.CHIEFID
  is '�����˱��';
comment on column T_CUSTOMER.PERSONID
  is 'ҵ����Ա���';
comment on column T_CUSTOMER.LINKMANID
  is '��ϵ�˱��';
comment on column T_CUSTOMER.TELEPHONE
  is '��ϵ�绰';
comment on column T_CUSTOMER.CAPITALIZATION
  is '�ʱ���';
comment on column T_CUSTOMER.ENGSHORNAME
  is 'Ӣ�ļ��';
comment on column T_CUSTOMER.EMAIL
  is '��������';
comment on column T_CUSTOMER.MOBILETEL
  is '�ƶ��绰';
comment on column T_CUSTOMER.WEBADDRESS
  is '��ַ';
comment on column T_CUSTOMER.BANKACCOUNT
  is '�����˺�';
comment on column T_CUSTOMER.FAXNO
  is '�������';
comment on column T_CUSTOMER.BANKNAME
  is '��������';
comment on column T_CUSTOMER.RATEOFDISCOUNT
  is '����';
comment on column T_CUSTOMER.PRICERANK
  is '�ۼ۵ȼ�';
comment on column T_CUSTOMER.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column T_CUSTOMER.BUILDUPDATE
  is '�ͻ���������';
comment on column T_CUSTOMER.LASTVISITDATE
  is '����ݷ���';
comment on column T_CUSTOMER.BOOKVISITDATE
  is 'ԤԼ�ݷ���';
comment on column T_CUSTOMER.INVALIDDATE
  is '��ֹ������';
comment on column T_CUSTOMER.AMOUNTQUOTA
  is '�˿���';
comment on column T_CUSTOMER.REMAINQUATA
  is 'ʣ����';
comment on column T_CUSTOMER.RECRWAY
  is '�տ�����';
comment on column T_CUSTOMER.RECEIVABLES
  is '�տ�����';
comment on column T_CUSTOMER.DAYOFCLOSE
  is 'ÿ�½�����';
comment on column T_CUSTOMER.CREDITLEVEL
  is '���õȼ�';
comment on column T_CUSTOMER.INVOTYPENAME
  is '��Ʊ����';
comment on column T_CUSTOMER.ACCRECEIVABLE
  is 'Ӧ���˿��Ŀ';
comment on column T_CUSTOMER.STARTADVRECV
  is '�ڳ�Ԥ�տ�';
comment on column T_CUSTOMER.STARTRECEIVABLE
  is '�ڳ�Ӧ�տ�';
comment on column T_CUSTOMER.CURADVRECV
  is '��ĩԤ�տ�';
comment on column T_CUSTOMER.CURRECEIVABLE
  is '��ĩӦ�տ�';
comment on column T_CUSTOMER.NOTINVQUOTA
  is 'δ��Ʊ���';
comment on column T_CUSTOMER.ACCADVRECV
  is 'Ԥ���˿��Ŀ';
alter table T_CUSTOMER
  add primary key (CUSTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_CUSTOMER
  add constraint FK_CU_1 foreign key (CLASSID)
  references T_CUSTOM_CLASS (CLASSID);

prompt Creating T_WARE_MAIN...
create table T_WARE_MAIN
(
  WAREHOUSEID      VARCHAR2(10) not null,
  WAREHOUSENAME    VARCHAR2(20) not null,
  ENGNAME          VARCHAR2(20),
  SHORTNAME        VARCHAR2(20),
  LINKNAME         VARCHAR2(20),
  TELEPHONE        VARCHAR2(20),
  WAREHOUSEADDRESS VARCHAR2(100),
  MEMO             VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_WARE_MAIN.WAREHOUSEID
  is '�ֿ���';
comment on column T_WARE_MAIN.WAREHOUSENAME
  is '�ֿ�����';
comment on column T_WARE_MAIN.ENGNAME
  is 'Ӣ������';
comment on column T_WARE_MAIN.SHORTNAME
  is '���';
comment on column T_WARE_MAIN.LINKNAME
  is '��ϵ��Ա';
comment on column T_WARE_MAIN.TELEPHONE
  is '��ϵ�绰';
comment on column T_WARE_MAIN.WAREHOUSEADDRESS
  is '��ַ';
comment on column T_WARE_MAIN.MEMO
  is '��ע';
alter table T_WARE_MAIN
  add primary key (WAREHOUSEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_STOCKOUT_MAIN...
create table T_STOCKOUT_MAIN
(
  BILLID          VARCHAR2(20) not null,
  BILLDATE        DATE not null,
  BILLSTATUS      VARCHAR2(10) not null,
  AUDITORID       VARCHAR2(20),
  DOCUMENTMAKERID VARCHAR2(20),
  BUSINESSID      VARCHAR2(20),
  SUMAMTATAX      NUMBER(10,2) not null,
  SUMNUM          NUMBER not null,
  SUMPRICE        NUMBER(10,2) not null,
  CURRNAME        VARCHAR2(10) not null,
  GATHERMONTH     VARCHAR2(10) not null,
  GATHERSTYLE     VARCHAR2(20),
  GATHERDELAY     NUMBER,
  SALECLASSID     VARCHAR2(10) not null,
  DELIVERYADDRESS VARCHAR2(50) not null,
  WAREID          VARCHAR2(10) not null,
  CUSTID          VARCHAR2(10) not null,
  TELEPHONE1      VARCHAR2(20),
  TELEPHONE2      VARCHAR2(20),
  MEMO            VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_STOCKOUT_MAIN.BILLID
  is '���۳��ⵥID';
comment on column T_STOCKOUT_MAIN.BILLDATE
  is '��������';
comment on column T_STOCKOUT_MAIN.BILLSTATUS
  is '����״̬';
comment on column T_STOCKOUT_MAIN.AUDITORID
  is '�����ID';
comment on column T_STOCKOUT_MAIN.DOCUMENTMAKERID
  is '�Ƶ���ID';
comment on column T_STOCKOUT_MAIN.BUSINESSID
  is 'ҵ����ԱID';
comment on column T_STOCKOUT_MAIN.SUMAMTATAX
  is '��˰���';
comment on column T_STOCKOUT_MAIN.SUMNUM
  is '�����ܺ�';
comment on column T_STOCKOUT_MAIN.SUMPRICE
  is '������˰��';
comment on column T_STOCKOUT_MAIN.CURRNAME
  is '�ұ�';
comment on column T_STOCKOUT_MAIN.GATHERMONTH
  is '�տ��·�';
comment on column T_STOCKOUT_MAIN.GATHERSTYLE
  is '�տ�����';
comment on column T_STOCKOUT_MAIN.GATHERDELAY
  is '�տ�����';
comment on column T_STOCKOUT_MAIN.SALECLASSID
  is '���۳�������ID';
comment on column T_STOCKOUT_MAIN.DELIVERYADDRESS
  is '��ַ';
comment on column T_STOCKOUT_MAIN.WAREID
  is '�ֿ�ID';
comment on column T_STOCKOUT_MAIN.CUSTID
  is '�ͻ�ID';
comment on column T_STOCKOUT_MAIN.TELEPHONE1
  is '��ϵ�绰һ';
comment on column T_STOCKOUT_MAIN.TELEPHONE2
  is '��ϵ�绰��';
comment on column T_STOCKOUT_MAIN.MEMO
  is '��ע';
alter table T_STOCKOUT_MAIN
  add primary key (BILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_STOCKOUT_MAIN
  add constraint �ͻ���� foreign key (CUSTID)
  references T_CUSTOMER (CUSTID);
alter table T_STOCKOUT_MAIN
  add constraint ����� foreign key (AUDITORID)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_STOCKOUT_MAIN
  add constraint ҵ����Ա foreign key (BUSINESSID)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_STOCKOUT_MAIN
  add constraint ���òֿ� foreign key (WAREID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_STOCKOUT_MAIN
  add constraint �Ƶ��� foreign key (DOCUMENTMAKERID)
  references STAFF_MASTER_FILE (STAFFID);

prompt Creating T_ACCOUNT_SON...
create table T_ACCOUNT_SON
(
  BILLID      VARCHAR2(20) not null,
  BILLTYPEID  VARCHAR2(10) not null,
  CUSTID      VARCHAR2(10) not null,
  BILLDATE    DATE not null,
  BEFOREPRICE NUMBER(10,2) not null,
  NOWPRICE    NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_ACCOUNT_SON.BILLID
  is '�������';
comment on column T_ACCOUNT_SON.BILLTYPEID
  is '��Դ����';
comment on column T_ACCOUNT_SON.CUSTID
  is '�ͻ�ID';
comment on column T_ACCOUNT_SON.BILLDATE
  is '��������';
comment on column T_ACCOUNT_SON.BEFOREPRICE
  is 'ԭ�����';
comment on column T_ACCOUNT_SON.NOWPRICE
  is '�������';
alter table T_ACCOUNT_SON
  add primary key (BILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ACCOUNT_SON
  add constraint ���ⵥ����� foreign key (BILLID)
  references T_STOCKOUT_MAIN (BILLID);
alter table T_ACCOUNT_SON
  add constraint �ͻ�ID foreign key (CUSTID)
  references T_CUSTOMER (CUSTID);

prompt Creating T_ACCOUNT_WATER...
create table T_ACCOUNT_WATER
(
  BILLNOID VARCHAR2(20) not null,
  MONEY    NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_ACCOUNT_WATER
  is '�ͻ��˿���ˮ��';
comment on column T_ACCOUNT_WATER.BILLNOID
  is '���ⵥ��';
comment on column T_ACCOUNT_WATER.MONEY
  is '��¼���';
alter table T_ACCOUNT_WATER
  add constraint ������� foreign key (BILLNOID)
  references T_STOCKOUT_MAIN (BILLID);

prompt Creating T_RUSHPRICE_CASH...
create table T_RUSHPRICE_CASH
(
  CASHID   NUMBER(10) not null,
  CASHTYPE VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_RUSHPRICE_CASH
  is '�������ͱ�';
comment on column T_RUSHPRICE_CASH.CASHID
  is '�������ͱ�ID';
comment on column T_RUSHPRICE_CASH.CASHTYPE
  is '������������';
alter table T_RUSHPRICE_CASH
  add constraint PK_CASHIDSSA primary key (CASHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_ADVANCE_HOST...
create table T_ADVANCE_HOST
(
  ACCADVRECVID     NUMBER(10) not null,
  CUSTOMERID       NUMBER(10) not null,
  FUNDBILLDATE     DATE not null,
  FUNDBILLID       VARCHAR2(30) not null,
  CURR             VARCHAR2(10) not null,
  CASHID_ONE       NUMBER(10),
  CASHID_TWO       NUMBER(10),
  CASHID_THREE     NUMBER(10),
  CASH_ONE_PRICE   NUMBER(10,2),
  CASH_TWO_PRICE   NUMBER(10,2),
  CASH_THREE_PRICE NUMBER(10,2),
  CASHSUMPRICE     NUMBER(10,2),
  EXCHRATE         NUMBER(10,2),
  DISCOUNTPER      NUMBER(10,2),
  ACCMONTHTOMONTH  DATE not null,
  DEPARTID         NUMBER(10) not null,
  MAKERSIGN        VARCHAR2(10) not null,
  PERMITTERSIGN    VARCHAR2(10) not null,
  STATUS           NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_ADVANCE_HOST
  is 'Ԥ��������';
comment on column T_ADVANCE_HOST.ACCADVRECVID
  is 'Ԥ������';
comment on column T_ADVANCE_HOST.CUSTOMERID
  is '��Ӧ�̱��';
comment on column T_ADVANCE_HOST.FUNDBILLDATE
  is '��������';
comment on column T_ADVANCE_HOST.FUNDBILLID
  is '���ݺ���';
comment on column T_ADVANCE_HOST.CURR
  is '�ұ�';
comment on column T_ADVANCE_HOST.CASHID_ONE
  is 'Ԥ�����㷽ʽһ';
comment on column T_ADVANCE_HOST.CASHID_TWO
  is 'Ԥ�����㷽ʽ��';
comment on column T_ADVANCE_HOST.CASHID_THREE
  is 'Ԥ�����㷽ʽ��';
comment on column T_ADVANCE_HOST.CASH_ONE_PRICE
  is 'Ԥ�����㷽ʽһ���';
comment on column T_ADVANCE_HOST.CASH_TWO_PRICE
  is 'Ԥ�����㷽ʽ�����';
comment on column T_ADVANCE_HOST.CASH_THREE_PRICE
  is 'Ԥ�����㷽ʽ�����';
comment on column T_ADVANCE_HOST.CASHSUMPRICE
  is 'Ԥ�������ܽ��';
comment on column T_ADVANCE_HOST.EXCHRATE
  is '����';
comment on column T_ADVANCE_HOST.DISCOUNTPER
  is '�ۿ���';
comment on column T_ADVANCE_HOST.ACCMONTHTOMONTH
  is 'ƾ֤���';
comment on column T_ADVANCE_HOST.DEPARTID
  is '��������ID';
comment on column T_ADVANCE_HOST.MAKERSIGN
  is '�Ƶ���Ա';
comment on column T_ADVANCE_HOST.PERMITTERSIGN
  is '������Ա';
comment on column T_ADVANCE_HOST.STATUS
  is '����״̬';
alter table T_ADVANCE_HOST
  add constraint PK_ACCADVRECVID primary key (ACCADVRECVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ADVANCE_HOST
  add constraint FK_CASHID_ONE foreign key (CASHID_ONE)
  references T_RUSHPRICE_CASH (CASHID);
alter table T_ADVANCE_HOST
  add constraint FK_CASHID_THREE foreign key (CASHID_THREE)
  references T_RUSHPRICE_CASH (CASHID);
alter table T_ADVANCE_HOST
  add constraint FK_CASHID_TWO foreign key (CASHID_TWO)
  references T_RUSHPRICE_CASH (CASHID);

prompt Creating T_ADVANCE_DETAILS...
create table T_ADVANCE_DETAILS
(
  LINENO          NUMBER(11) not null,
  DETAILSID       NUMBER(30) not null,
  ACCADVRECVPRICE NUMBER(10,2),
  BILLTYPE        VARCHAR2(20),
  ORDERNO         VARCHAR2(30),
  CURPRERECV      NUMBER(10,2),
  DESCRIPTION     VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_ADVANCE_DETAILS
  is 'Ԥ�������';
comment on column T_ADVANCE_DETAILS.LINENO
  is '�к�';
comment on column T_ADVANCE_DETAILS.DETAILSID
  is 'Ԥ������';
comment on column T_ADVANCE_DETAILS.ACCADVRECVPRICE
  is 'Ԥ�����';
comment on column T_ADVANCE_DETAILS.BILLTYPE
  is '��Դ����';
comment on column T_ADVANCE_DETAILS.ORDERNO
  is '��Դ����';
comment on column T_ADVANCE_DETAILS.CURPRERECV
  is 'Ԥ�����';
comment on column T_ADVANCE_DETAILS.DESCRIPTION
  is 'ժҪ';
alter table T_ADVANCE_DETAILS
  add constraint PK_T_ADVANCE_DETAILS_LANDD primary key (LINENO, DETAILSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_ADVANCE_DETAILS
  add constraint FK_DETAILS_DETAILSID foreign key (DETAILSID)
  references T_ADVANCE_HOST (ACCADVRECVID);

prompt Creating T_BUY...
create table T_BUY
(
  BILLNO            VARCHAR2(40) not null,
  BILLNODATE        DATE not null,
  CUSTOMERID        VARCHAR2(40) not null,
  FACTCURRYENCYNAME VARCHAR2(40) not null,
  BILLSTYLEID       VARCHAR2(40),
  PRICETAX          NUMBER default 1 not null,
  EXCHRATE          NUMBER(10,3) default 1.0000 not null,
  MAKER             VARCHAR2(40),
  PERMIT            VARCHAR2(40),
  SALESID           VARCHAR2(40) not null,
  DEPARTID          VARCHAR2(40) not null,
  CHECKSTATE        NUMBER default 1 not null,
  PROJECTID         VARCHAR2(40) not null,
  BTYPE             NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_BUY.BILLNO
  is '���ݱ��';
comment on column T_BUY.BILLNODATE
  is '��������';
comment on column T_BUY.CUSTOMERID
  is '��Ӧ�̱��';
comment on column T_BUY.FACTCURRYENCYNAME
  is '�ұ�';
comment on column T_BUY.BILLSTYLEID
  is '�ɹ���������';
comment on column T_BUY.PRICETAX
  is '�����Ƿ�˰��1,��˰,0��δ˰��';
comment on column T_BUY.EXCHRATE
  is '����';
comment on column T_BUY.MAKER
  is '�Ƶ���Ա(������Ա��)';
comment on column T_BUY.PERMIT
  is '������Ա��������Ա��';
comment on column T_BUY.SALESID
  is '�ɹ���Ա��������Ա��';
comment on column T_BUY.DEPARTID
  is '�������ű��';
comment on column T_BUY.CHECKSTATE
  is '���״̬��1��δ��ˣ�0������ˣ�';
comment on column T_BUY.PROJECTID
  is '������Ŀ';
comment on column T_BUY.BTYPE
  is '�������ͱ��';
alter table T_BUY
  add constraint BILLNO_BUYS_PK primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_BUY_DETAILS...
create table T_BUY_DETAILS
(
  BILLNO     VARCHAR2(40) not null,
  LINE       NUMBER not null,
  PRODID     VARCHAR2(40) not null,
  SQUANTITY  NUMBER not null,
  OLDPRICE   NUMBER(10,3) not null,
  DISCOUNT   NUMBER(10,3) not null,
  SPRICE     NUMBER(10,3) not null,
  AMOUNT     NUMBER(10,3) not null,
  TAXRATE    NUMBER(10,3) not null,
  TAXAMT     NUMBER(10,3) not null,
  VFTOLAT    NUMBER(10,3) not null,
  ISGIFT     NUMBER default 1 not null,
  PREINDATE  DATE not null,
  QTYREMAIN  NUMBER default 0 not null,
  TRAANTYPE  VARCHAR2(40) not null,
  FROMNO     VARCHAR2(40) not null,
  ITEMREMARK VARCHAR2(500),
  BTYPE      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_BUY_DETAILS.BILLNO
  is '���ݱ��';
comment on column T_BUY_DETAILS.LINE
  is '�к�';
comment on column T_BUY_DETAILS.PRODID
  is '���ϱ��';
comment on column T_BUY_DETAILS.SQUANTITY
  is '����';
comment on column T_BUY_DETAILS.OLDPRICE
  is '�ۿ�ǰ����';
comment on column T_BUY_DETAILS.DISCOUNT
  is '����';
comment on column T_BUY_DETAILS.SPRICE
  is '����';
comment on column T_BUY_DETAILS.AMOUNT
  is '���';
comment on column T_BUY_DETAILS.TAXRATE
  is '˰��';
comment on column T_BUY_DETAILS.TAXAMT
  is '˰��';
comment on column T_BUY_DETAILS.VFTOLAT
  is '��˰���';
comment on column T_BUY_DETAILS.ISGIFT
  is '�Ƿ�����Ʒ(1.����Ʒ��0.����Ʒ)';
comment on column T_BUY_DETAILS.PREINDATE
  is 'Ԥ�����';
comment on column T_BUY_DETAILS.QTYREMAIN
  is 'δ�������';
comment on column T_BUY_DETAILS.TRAANTYPE
  is '��Դ����';
comment on column T_BUY_DETAILS.FROMNO
  is '��Դ����';
comment on column T_BUY_DETAILS.ITEMREMARK
  is '��¼��ע';
comment on column T_BUY_DETAILS.BTYPE
  is '�������ͱ��';
alter table T_BUY_DETAILS
  add constraint BILLNOANDLINES_PK primary key (BILLNO, LINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_BUY_INQUIRY...
create table T_BUY_INQUIRY
(
  BILLNO            VARCHAR2(40) not null,
  BILLNODATE        DATE not null,
  CUSTOMERID        VARCHAR2(40) not null,
  FACTCURRYENCYNAME VARCHAR2(40) not null,
  VALIDDATE         DATE not null,
  PRICETAX          NUMBER not null,
  EXCHRATE          BINARY_DOUBLE default 1.0000 not null,
  MAKER             VARCHAR2(40),
  PERMIT            VARCHAR2(40),
  SALESID           VARCHAR2(40) not null,
  DEPARTID          VARCHAR2(40) not null,
  CHECKSTATE        NUMBER default 1 not null,
  OUTADDRESS        VARCHAR2(500),
  BTYPE             NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_BUY_INQUIRY.BILLNO
  is '���ݱ��';
comment on column T_BUY_INQUIRY.BILLNODATE
  is '��������';
comment on column T_BUY_INQUIRY.CUSTOMERID
  is '��Ӧ�̱��';
comment on column T_BUY_INQUIRY.FACTCURRYENCYNAME
  is '�ұ�';
comment on column T_BUY_INQUIRY.VALIDDATE
  is '��Ч����';
comment on column T_BUY_INQUIRY.PRICETAX
  is '�����Ƿ�˰��1,��˰,0��δ˰��';
comment on column T_BUY_INQUIRY.EXCHRATE
  is '����';
comment on column T_BUY_INQUIRY.MAKER
  is '�Ƶ���Ա';
comment on column T_BUY_INQUIRY.PERMIT
  is '������Ա';
comment on column T_BUY_INQUIRY.SALESID
  is '�ɹ���Ա';
comment on column T_BUY_INQUIRY.DEPARTID
  is '�������ű��';
comment on column T_BUY_INQUIRY.CHECKSTATE
  is '���״̬��1��δ��ˣ�0������ˣ�';
comment on column T_BUY_INQUIRY.OUTADDRESS
  is '�ͻ���ַ';
comment on column T_BUY_INQUIRY.BTYPE
  is '�������ͱ��';
alter table T_BUY_INQUIRY
  add constraint BILLNO_BUY_PK primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_BUY_INQUIRY_DETAILS...
create table T_BUY_INQUIRY_DETAILS
(
  BILLNO       VARCHAR2(20) not null,
  LINE         NUMBER not null,
  PRODID       VARCHAR2(20) not null,
  CLASSNAME    VARCHAR2(20) not null,
  PRODSIZE     VARCHAR2(20) not null,
  STUUNTILNAME VARCHAR2(20) not null,
  SQUANTITY    NUMBER not null,
  AMOUNT       NUMBER(10,3) not null,
  TAXRATE      NUMBER(10,3) not null,
  TAXAMT       NUMBER(10,3) not null,
  VFTOLAT      NUMBER(10,3) not null,
  ISGIFT       NUMBER default 0 not null,
  ITEMREMARK   VARCHAR2(500),
  TRANTYPE     VARCHAR2(20) not null,
  FROMNO       VARCHAR2(20) not null,
  BTYPE        NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_BUY_INQUIRY_DETAILS.BILLNO
  is '���ݱ��';
comment on column T_BUY_INQUIRY_DETAILS.LINE
  is '�к�';
comment on column T_BUY_INQUIRY_DETAILS.PRODID
  is '���ϱ��';
comment on column T_BUY_INQUIRY_DETAILS.CLASSNAME
  is '��������';
comment on column T_BUY_INQUIRY_DETAILS.PRODSIZE
  is '����ͺ�';
comment on column T_BUY_INQUIRY_DETAILS.STUUNTILNAME
  is '��λ����';
comment on column T_BUY_INQUIRY_DETAILS.SQUANTITY
  is '����';
comment on column T_BUY_INQUIRY_DETAILS.AMOUNT
  is '���';
comment on column T_BUY_INQUIRY_DETAILS.TAXRATE
  is '˰��';
comment on column T_BUY_INQUIRY_DETAILS.TAXAMT
  is '˰��';
comment on column T_BUY_INQUIRY_DETAILS.VFTOLAT
  is '��˰���';
comment on column T_BUY_INQUIRY_DETAILS.ISGIFT
  is '�Ƿ�����Ʒ��1.����Ʒ��0.����Ʒ��';
comment on column T_BUY_INQUIRY_DETAILS.ITEMREMARK
  is '��¼��ע';
comment on column T_BUY_INQUIRY_DETAILS.TRANTYPE
  is '��Դ����(ת���ĵ�������)';
comment on column T_BUY_INQUIRY_DETAILS.FROMNO
  is '��Դ����(ת���ĵ��ݺ�)';
comment on column T_BUY_INQUIRY_DETAILS.BTYPE
  is '�������ͱ��';
alter table T_BUY_INQUIRY_DETAILS
  add constraint BILLNOANDLINE_PK primary key (BILLNO, LINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_CUSTOM_ADDRESS_DETAIL...
create table T_CUSTOM_ADDRESS_DETAIL
(
  CUSTID       VARCHAR2(20) not null,
  ADDRESSCODE  VARCHAR2(50) not null,
  ADDRESS      VARCHAR2(100) not null,
  YOUZCODING   VARCHAR2(20),
  LINKMAN      VARCHAR2(50),
  LINKMANNAME  VARCHAR2(50),
  TELEPHONE    VARCHAR2(50),
  FAXNO        VARCHAR2(50),
  WALKINGROUTE VARCHAR2(200),
  MEMO         VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_CUSTOM_ADDRESS_DETAIL
  add primary key (CUSTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_CUSTOM_ADDRESS_DETAIL
  add constraint FK_CU_DE_1 foreign key (CUSTID)
  references T_CUSTOMER (CUSTID);

prompt Creating T_ORDER_BILL_MAIN...
create table T_ORDER_BILL_MAIN
(
  FLAG          NUMBER(2) not null,
  BILLNO        VARCHAR2(14) not null,
  BILLDATE      DATE not null,
  CUSTOMERID    VARCHAR2(50),
  ADDRESSID     VARCHAR2(50) not null,
  ZIPCODE       VARCHAR2(12) not null,
  CUSTADDRESS   VARCHAR2(150) not null,
  FORMALCUST    VARCHAR2(50) not null,
  VALIDDATE     DATE not null,
  SALESMAN      VARCHAR2(10) not null,
  DEPARTID      NUMBER(8) not null,
  PROJECTID     NUMBER(10) not null,
  CURRID        NUMBER(4) not null,
  EXCHRATE      NUMBER(4,2) not null,
  MAKER         NUMBER(10) not null,
  PERMITTER     NUMBER(10) not null,
  DETAIL        NUMBER(4) not null,
  REMARK        VARCHAR2(400) not null,
  ISTRANS       NUMBER(4) not null,
  SUMBTAXAMT    NUMBER(10,2) not null,
  TAXTYPE       NUMBER(4) not null,
  SUMTAX        NUMBER(10,2) not null,
  SUMQTY        NUMBER(10,2) not null,
  BILLSTATUS    NUMBER(4) not null,
  MERGEOUTSTATE NUMBER(4) not null,
  BILLSTYLEID   NUMBER(10) not null,
  BILLSTYLENAME VARCHAR2(10) not null,
  SIGNBACK      NUMBER(4) not null,
  HASCHECK      NUMBER(4) default 0 not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_ORDER_BILL_MAIN
  is '�ɹ��빺������';
comment on column T_ORDER_BILL_MAIN.FLAG
  is '�������ͱ��';
comment on column T_ORDER_BILL_MAIN.BILLNO
  is '���ݱ��';
comment on column T_ORDER_BILL_MAIN.BILLDATE
  is '��������';
comment on column T_ORDER_BILL_MAIN.CUSTOMERID
  is '��Ӧ�̱�ţ����';
comment on column T_ORDER_BILL_MAIN.ADDRESSID
  is '��Ӧ�̵�ַ���';
comment on column T_ORDER_BILL_MAIN.ZIPCODE
  is '�ʱ�';
comment on column T_ORDER_BILL_MAIN.CUSTADDRESS
  is '��Ӧ�̵�ַ';
comment on column T_ORDER_BILL_MAIN.FORMALCUST
  is '��ʽ�ͻ���1���ǣ�0��';
comment on column T_ORDER_BILL_MAIN.VALIDDATE
  is '��Ч����';
comment on column T_ORDER_BILL_MAIN.SALESMAN
  is '�빺��Ա����';
comment on column T_ORDER_BILL_MAIN.DEPARTID
  is '�빺���ű��';
comment on column T_ORDER_BILL_MAIN.PROJECTID
  is '������Ŀ���';
comment on column T_ORDER_BILL_MAIN.CURRID
  is '�ұ�';
comment on column T_ORDER_BILL_MAIN.EXCHRATE
  is '����';
comment on column T_ORDER_BILL_MAIN.MAKER
  is '�Ƶ���Ա';
comment on column T_ORDER_BILL_MAIN.PERMITTER
  is '������Ա';
comment on column T_ORDER_BILL_MAIN.DETAIL
  is '�������';
comment on column T_ORDER_BILL_MAIN.REMARK
  is '��ע';
comment on column T_ORDER_BILL_MAIN.ISTRANS
  is '��ת�ɹ�����';
comment on column T_ORDER_BILL_MAIN.SUMBTAXAMT
  is 'δ˰���';
comment on column T_ORDER_BILL_MAIN.TAXTYPE
  is '��˰���';
comment on column T_ORDER_BILL_MAIN.SUMTAX
  is '˰��';
comment on column T_ORDER_BILL_MAIN.SUMQTY
  is '�����ϼ�';
comment on column T_ORDER_BILL_MAIN.BILLSTATUS
  is '������0��δ�᰸��1����
�᰸��2����Ч��
';
comment on column T_ORDER_BILL_MAIN.MERGEOUTSTATE
  is '������ת״̬��ʶ';
comment on column T_ORDER_BILL_MAIN.BILLSTYLEID
  is '�ɹ��빺���ͱ��';
comment on column T_ORDER_BILL_MAIN.BILLSTYLENAME
  is '�ɹ��빺��������';
comment on column T_ORDER_BILL_MAIN.SIGNBACK
  is 'ǩ��';
comment on column T_ORDER_BILL_MAIN.HASCHECK
  is '�Ƿ���ˣ�0:��1���ǣ�';

prompt Creating T_ORDER_BILL_SUB...
create table T_ORDER_BILL_SUB
(
  SERNO          NUMBER(4) not null,
  FLAG           NUMBER(4) not null,
  BILLNO         VARCHAR2(14) not null,
  ROWNO          NUMBER(4) not null,
  BILLDATE       DATE not null,
  PRODID         NUMBER(4) not null,
  PRODNAME       VARCHAR2(60) not null,
  PRODSIZE       VARCHAR2(60) not null,
  CURRID         VARCHAR2(4) not null,
  SUNITID        NUMBER(4) not null,
  SUNIT          VARCHAR2(8) not null,
  SPRICE         NUMBER(10,2) not null,
  AMOUNT         NUMBER(10,2) not null,
  SQUANTITY      NUMBER(4) not null,
  FROMNO         VARCHAR2(15) not null,
  TRANTYPE       NUMBER(4) not null,
  PREINDATE      DATE not null,
  QTYREMAIN      NUMBER(10,2) not null,
  ITEMREMARK     VARCHAR2(400) not null,
  SUGGESTPURDATE DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_PROD_PATTERN...
create table T_PROD_PATTERN
(
  CLASSID           VARCHAR2(10) not null,
  CLASSNAME         VARCHAR2(50) not null,
  ENGNAME           VARCHAR2(50),
  ACCINVENTTORYNAME VARCHAR2(20),
  SENDOUTWARE       VARCHAR2(20),
  MEMO              VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_PROD_PATTERN.CLASSID
  is '�����';
comment on column T_PROD_PATTERN.CLASSNAME
  is '�������';
comment on column T_PROD_PATTERN.ENGNAME
  is 'Ӣ������';
comment on column T_PROD_PATTERN.ACCINVENTTORYNAME
  is '�����Ŀ';
comment on column T_PROD_PATTERN.SENDOUTWARE
  is '������Ʒ��Ŀ';
comment on column T_PROD_PATTERN.MEMO
  is '��ע';
alter table T_PROD_PATTERN
  add primary key (CLASSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_PROD_MAIN...
create table T_PROD_MAIN
(
  PRODID           VARCHAR2(20) not null,
  CLASSID          VARCHAR2(10) not null,
  CLASSNAME        VARCHAR2(20) not null,
  PRODNAME         VARCHAR2(50) not null,
  PRODSIZE         VARCHAR2(50),
  ENGNAME          VARCHAR2(20),
  CURRNAME         VARCHAR2(20) not null,
  SUGGESTPRICE     NUMBER(10,2) not null,
  SALESPRICEA      NUMBER(10,2) not null,
  SALESPRICEB      NUMBER(10,2) not null,
  SALESPRICEC      NUMBER(10,2) not null,
  SALESPRICED      NUMBER(10,2) not null,
  SALESPRICEE      NUMBER(10,2) not null,
  STDPRICE         NUMBER(10,2) not null,
  BUSITAXRATE      NUMBER(10,2) not null,
  EFFECTDATEUSED   DATE,
  VALIDATEUSED     DATE,
  DEFVALIDAY       NUMBER,
  PRODDESC         VARCHAR2(100),
  SAFEQTY          NUMBER not null,
  MAJONRSUPPLIERID VARCHAR2(20),
  BOUTSTOCKDAY     DATE,
  BINSTOCKDAY      DATE,
  BSTDCOST         NUMBER(10,2) not null,
  BAVGCOST         NUMBER(10,2) not null,
  PRICEOFTAX       VARCHAR2(10) not null,
  BTOTALCOST       NUMBER(10,2) not null,
  STDUNIT          VARCHAR2(10),
  BALLAMT          NUMBER not null,
  BCURRSTOCK       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_PROD_MAIN.PRODID
  is '���ϱ��';
comment on column T_PROD_MAIN.CLASSID
  is '�������ID';
comment on column T_PROD_MAIN.CLASSNAME
  is '�������';
comment on column T_PROD_MAIN.PRODNAME
  is '��������';
comment on column T_PROD_MAIN.PRODSIZE
  is '����ͺ�';
comment on column T_PROD_MAIN.ENGNAME
  is 'Ӣ������';
comment on column T_PROD_MAIN.CURRNAME
  is '�ұ�';
comment on column T_PROD_MAIN.SUGGESTPRICE
  is '�����ۼ�';
comment on column T_PROD_MAIN.SALESPRICEA
  is '�����ۼ�A';
comment on column T_PROD_MAIN.SALESPRICEB
  is '�����ۼ�B';
comment on column T_PROD_MAIN.SALESPRICEC
  is '�����ۼ�C';
comment on column T_PROD_MAIN.SALESPRICED
  is '�����ۼ�D';
comment on column T_PROD_MAIN.SALESPRICEE
  is '�����ۼ�E';
comment on column T_PROD_MAIN.STDPRICE
  is '��׼����';
comment on column T_PROD_MAIN.BUSITAXRATE
  is '˰��';
comment on column T_PROD_MAIN.EFFECTDATEUSED
  is 'ʹ�ó�������';
comment on column T_PROD_MAIN.VALIDATEUSED
  is 'ʹ����Ч����';
comment on column T_PROD_MAIN.DEFVALIDAY
  is '��Ч����';
comment on column T_PROD_MAIN.PRODDESC
  is '��ע';
comment on column T_PROD_MAIN.SAFEQTY
  is '��ȫ����';
comment on column T_PROD_MAIN.MAJONRSUPPLIERID
  is '����Ӧ�̱��';
comment on column T_PROD_MAIN.BOUTSTOCKDAY
  is '��������';
comment on column T_PROD_MAIN.BINSTOCKDAY
  is '��������';
comment on column T_PROD_MAIN.BSTDCOST
  is '��׼�ɱ�';
comment on column T_PROD_MAIN.BAVGCOST
  is '��׼ƽ���ɱ�';
comment on column T_PROD_MAIN.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column T_PROD_MAIN.BTOTALCOST
  is '�ڳ��ܳɱ�';
comment on column T_PROD_MAIN.STDUNIT
  is '������λ';
comment on column T_PROD_MAIN.BALLAMT
  is '���������';
comment on column T_PROD_MAIN.BCURRSTOCK
  is '����������';
alter table T_PROD_MAIN
  add primary key (PRODID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_PROD_MAIN
  add constraint ������� foreign key (CLASSID)
  references T_PROD_PATTERN (CLASSID);

prompt Creating T_QUOTATION...
create table T_QUOTATION
(
  BILLNO           VARCHAR2(20) not null,
  CUSTOMERID       VARCHAR2(20) not null,
  BILLDATE         DATE not null,
  VALIDATES        DATE not null,
  ADDERSSID        VARCHAR2(20) not null,
  CUSTCURRENCYNAME VARCHAR2(20),
  PRICEOFTAX       VARCHAR2(20),
  EXCHRATE         NUMBER(10,7),
  SALESID          VARCHAR2(20),
  MAKER            VARCHAR2(20),
  DAPARID          VARCHAR2(20),
  PERMITTER        VARCHAR2(20),
  REMARKS          VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_QUOTATION.BILLNO
  is '���ݱ��';
comment on column T_QUOTATION.CUSTOMERID
  is '�ͻ����';
comment on column T_QUOTATION.BILLDATE
  is '��������';
comment on column T_QUOTATION.VALIDATES
  is '��Ч����';
comment on column T_QUOTATION.ADDERSSID
  is '��ַ���';
comment on column T_QUOTATION.CUSTCURRENCYNAME
  is '�ұ�����';
comment on column T_QUOTATION.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column T_QUOTATION.EXCHRATE
  is '����';
comment on column T_QUOTATION.SALESID
  is 'ҵ����Ա���';
comment on column T_QUOTATION.MAKER
  is '�Ƶ���Ա';
comment on column T_QUOTATION.DAPARID
  is '���ű��';
comment on column T_QUOTATION.PERMITTER
  is '������Ա';
comment on column T_QUOTATION.REMARKS
  is '��ע';
alter table T_QUOTATION
  add primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_QUOTATION
  add constraint FK_QU_1 foreign key (CUSTOMERID)
  references T_CUSTOMER (CUSTID);
alter table T_QUOTATION
  add constraint FK_QU_2 foreign key (SALESID)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_QUOTATION
  add constraint FK_QU_3 foreign key (MAKER)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_QUOTATION
  add constraint FK_QU_4 foreign key (PERMITTER)
  references STAFF_MASTER_FILE (STAFFID);

prompt Creating T_QUOTATION_DETAIL...
create table T_QUOTATION_DETAIL
(
  BILLNO              VARCHAR2(20) not null,
  LINEID              INTEGER not null,
  PRODID              VARCHAR2(50) not null,
  PRODNAME            VARCHAR2(50),
  PRODSIZE            VARCHAR2(50),
  STDUNITNAME         VARCHAR2(20),
  SUMS                NUMBER,
  DSCOUNT_FRONT_PRICE NUMBER(10,7),
  BROKEN_NUMBER       NUMBER(10,7),
  PICE                NUMBER(10,7),
  MONEY               NUMBER(10,7),
  TAX_RATE            NUMBER(10,7),
  TAX                 NUMBER(10,7),
  ISGIFT              INTEGER,
  TAX_INCLUDED_MONEY  NUMBER(10,7),
  REMARKS             VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_QUOTATION_DETAIL.BILLNO
  is '���ݱ��';
comment on column T_QUOTATION_DETAIL.LINEID
  is '�к�';
comment on column T_QUOTATION_DETAIL.PRODID
  is '���ϱ��';
comment on column T_QUOTATION_DETAIL.PRODNAME
  is '��������';
comment on column T_QUOTATION_DETAIL.PRODSIZE
  is '����ͺ�';
comment on column T_QUOTATION_DETAIL.STDUNITNAME
  is '��λ����';
comment on column T_QUOTATION_DETAIL.SUMS
  is '����';
comment on column T_QUOTATION_DETAIL.DSCOUNT_FRONT_PRICE
  is '�ۿ�ǰ����';
comment on column T_QUOTATION_DETAIL.BROKEN_NUMBER
  is '����';
comment on column T_QUOTATION_DETAIL.PICE
  is '����';
comment on column T_QUOTATION_DETAIL.MONEY
  is '���';
comment on column T_QUOTATION_DETAIL.TAX_RATE
  is '˰��';
comment on column T_QUOTATION_DETAIL.TAX
  is '��˰';
comment on column T_QUOTATION_DETAIL.ISGIFT
  is '�Ƿ���Ʒ';
comment on column T_QUOTATION_DETAIL.TAX_INCLUDED_MONEY
  is '��˰���';
comment on column T_QUOTATION_DETAIL.REMARKS
  is '��ע';
alter table T_QUOTATION_DETAIL
  add primary key (BILLNO, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_QUOTATION_DETAIL
  add constraint FK_QU_DE_1 foreign key (BILLNO)
  references T_QUOTATION (BILLNO);
alter table T_QUOTATION_DETAIL
  add constraint FK_QU_DE_2 foreign key (PRODID)
  references T_PROD_MAIN (PRODID);

prompt Creating T_RECEIVABLE...
create table T_RECEIVABLE
(
  FUNDBILLID         VARCHAR2(20) not null,
  FUNDBILLDATE       DATE not null,
  CUSTOMERID         VARCHAR2(20) not null,
  RCURRENCYNAME      VARCHAR2(20) not null,
  CASHSTYLEID        VARCHAR2(20),
  CASHSTYLEMONEY     NUMBER(10,2),
  VISASTYLEID        VARCHAR2(20),
  VISASTYLEMONEY     NUMBER(10,2),
  OTHERPAYSTYLEID    VARCHAR2(20),
  OTHERPAYSTYLEMONEY NUMBER(10,2),
  EXCHRATE           NUMBER(10,2),
  DISCOUNTPER        NUMBER(10,2),
  ACCMONTHTOMONTH    DATE,
  DEPTFROMID         VARCHAR2(20) not null,
  MAKERNAME          VARCHAR2(20) not null,
  PERMITTERNAME      VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_RECEIVABLE.FUNDBILLID
  is '���ݺ��룬����';
comment on column T_RECEIVABLE.FUNDBILLDATE
  is '��������';
comment on column T_RECEIVABLE.CUSTOMERID
  is '�ͻ����';
comment on column T_RECEIVABLE.RCURRENCYNAME
  is '�ұ�';
comment on column T_RECEIVABLE.CASHSTYLEID
  is '���㷽ʽһ';
comment on column T_RECEIVABLE.CASHSTYLEMONEY
  is '���㷽ʽһ���';
comment on column T_RECEIVABLE.VISASTYLEID
  is '���㷽ʽ��';
comment on column T_RECEIVABLE.VISASTYLEMONEY
  is '���㷽ʽ�����';
comment on column T_RECEIVABLE.OTHERPAYSTYLEID
  is '���㷽ʽ��';
comment on column T_RECEIVABLE.OTHERPAYSTYLEMONEY
  is '���㷽ʽ�����';
comment on column T_RECEIVABLE.EXCHRATE
  is '����';
comment on column T_RECEIVABLE.DISCOUNTPER
  is '�ۿ���';
comment on column T_RECEIVABLE.ACCMONTHTOMONTH
  is '��ֹ����';
comment on column T_RECEIVABLE.DEPTFROMID
  is '���ű��';
comment on column T_RECEIVABLE.MAKERNAME
  is '�Ƶ���Ա';
comment on column T_RECEIVABLE.PERMITTERNAME
  is '������Ա';
alter table T_RECEIVABLE
  add primary key (FUNDBILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_RECEIVABLE_ADVANCE...
create table T_RECEIVABLE_ADVANCE
(
  FUNDBILLID         VARCHAR2(20) not null,
  FUNDBILLDATE       DATE not null,
  CUSTOMERID         VARCHAR2(20) not null,
  RCURRENCYNAME      VARCHAR2(20) not null,
  CASHSTYLEID        VARCHAR2(30),
  CASHSTYLEMONEY     NUMBER(10,2),
  VISASTYLEID        VARCHAR2(30),
  VISASTYLEMONEY     NUMBER(10,2),
  OTHERPAYSTYLEID    VARCHAR2(30),
  OTHERPAYSTYLEMONEY NUMBER(10,2),
  EXCHRATE           NUMBER(10,2),
  DISCOUNTPER        NUMBER(10,2),
  ACCMONTHTOMONTH    DATE,
  DEPTFROMID         NUMBER not null,
  MAKERNAME          VARCHAR2(20),
  PERMITTERNAME      VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_RECEIVABLE_ADVANCE.FUNDBILLID
  is '���ݺ��룬����';
comment on column T_RECEIVABLE_ADVANCE.FUNDBILLDATE
  is '��������';
comment on column T_RECEIVABLE_ADVANCE.CUSTOMERID
  is '�ͻ����';
comment on column T_RECEIVABLE_ADVANCE.RCURRENCYNAME
  is '�ұ�';
comment on column T_RECEIVABLE_ADVANCE.CASHSTYLEID
  is '���㷽ʽһ';
comment on column T_RECEIVABLE_ADVANCE.CASHSTYLEMONEY
  is '���㷽ʽһ���';
comment on column T_RECEIVABLE_ADVANCE.VISASTYLEID
  is '���㷽ʽ��';
comment on column T_RECEIVABLE_ADVANCE.VISASTYLEMONEY
  is '���㷽ʽ�����';
comment on column T_RECEIVABLE_ADVANCE.OTHERPAYSTYLEID
  is '���㷽ʽ��';
comment on column T_RECEIVABLE_ADVANCE.OTHERPAYSTYLEMONEY
  is '���㷽ʽ�����';
comment on column T_RECEIVABLE_ADVANCE.EXCHRATE
  is '����';
comment on column T_RECEIVABLE_ADVANCE.DISCOUNTPER
  is '�ۿ���';
comment on column T_RECEIVABLE_ADVANCE.ACCMONTHTOMONTH
  is '��ֹ����';
comment on column T_RECEIVABLE_ADVANCE.DEPTFROMID
  is '���ű��';
comment on column T_RECEIVABLE_ADVANCE.MAKERNAME
  is '�Ƶ���Ա';
comment on column T_RECEIVABLE_ADVANCE.PERMITTERNAME
  is '������Ա';
alter table T_RECEIVABLE_ADVANCE
  add primary key (FUNDBILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RECEIVABLE_ADVANCE
  add constraint RECEADVANCE_FK_CUSTOMER foreign key (CUSTOMERID)
  references T_CUSTOMER (CUSTID);
alter table T_RECEIVABLE_ADVANCE
  add constraint RECEADVANCE_FK_DEPART foreign key (DEPTFROMID)
  references DEPART (DEPARTID);

prompt Creating T_RECEIVABLEADVANCE_DETAIL...
create table T_RECEIVABLEADVANCE_DETAIL
(
  FUNDBILLID          VARCHAR2(20) not null,
  LINEID              VARCHAR2(20) not null,
  SOURCESORTING       VARCHAR2(20) not null,
  SOURCESORTINGBILLNO VARCHAR2(20) not null,
  CURPRECV            NUMBER(10,2) not null,
  CURMONEY            NUMBER(10,2) not null,
  ABSTRACTS           VARCHAR2(500),
  ADDFIELD1           VARCHAR2(50),
  ADDFIELD2           VARCHAR2(50),
  MEMO                VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_RECEIVABLEADVANCE_DETAIL.FUNDBILLID
  is '���ݺ���';
comment on column T_RECEIVABLEADVANCE_DETAIL.LINEID
  is '����';
comment on column T_RECEIVABLEADVANCE_DETAIL.SOURCESORTING
  is '��Դ��';
comment on column T_RECEIVABLEADVANCE_DETAIL.SOURCESORTINGBILLNO
  is '��Դ����';
comment on column T_RECEIVABLEADVANCE_DETAIL.CURPRECV
  is 'Ԥ�����';
comment on column T_RECEIVABLEADVANCE_DETAIL.CURMONEY
  is 'Ԥ�ս��';
comment on column T_RECEIVABLEADVANCE_DETAIL.ABSTRACTS
  is 'ժҪ';
comment on column T_RECEIVABLEADVANCE_DETAIL.ADDFIELD1
  is '�Զ���һ';
comment on column T_RECEIVABLEADVANCE_DETAIL.ADDFIELD2
  is '�Զ����';
comment on column T_RECEIVABLEADVANCE_DETAIL.MEMO
  is '��ע';
alter table T_RECEIVABLEADVANCE_DETAIL
  add primary key (FUNDBILLID, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RECEIVABLEADVANCE_DETAIL
  add foreign key (FUNDBILLID)
  references T_RECEIVABLE_ADVANCE (FUNDBILLID);

prompt Creating T_RECEIVABLE_DETAIL...
create table T_RECEIVABLE_DETAIL
(
  FUNDBILLID    VARCHAR2(20) not null,
  LINENO        VARCHAR2(20) not null,
  SOURCESORTING VARCHAR2(20) not null,
  ORGINBILLNO   VARCHAR2(20) not null,
  ORGINBILLDATE DATE not null,
  INVOICENO     VARCHAR2(20) not null,
  CURRID        VARCHAR2(20) not null,
  EXCHRATE      NUMBER(10,2),
  TOTALMONEY    NUMBER(10,2),
  DISCOUNTMONEY NUMBER(10,2),
  OFFSET        NUMBER(10,2),
  NOWLEFT       NUMBER(10,2),
  OFFSETMONEY   NUMBER(10,2),
  CUSTID        VARCHAR2(20),
  CUSTNAME      VARCHAR2(20),
  DEPTID        VARCHAR2(20) not null,
  DEPARTNAME    VARCHAR2(20) not null,
  PERSONNAME    VARCHAR2(20),
  ADDFIELD1     VARCHAR2(50),
  ADDFIELD2     VARCHAR2(50),
  MEMO          VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_RECEIVABLE_DETAIL.FUNDBILLID
  is '���ݱ��';
comment on column T_RECEIVABLE_DETAIL.LINENO
  is '����';
comment on column T_RECEIVABLE_DETAIL.SOURCESORTING
  is '���𣬣����۳��⣬�˻���';
comment on column T_RECEIVABLE_DETAIL.ORGINBILLNO
  is 'ԭ�����';
comment on column T_RECEIVABLE_DETAIL.ORGINBILLDATE
  is 'ԭ������';
comment on column T_RECEIVABLE_DETAIL.INVOICENO
  is '�������';
comment on column T_RECEIVABLE_DETAIL.CURRID
  is '����';
comment on column T_RECEIVABLE_DETAIL.EXCHRATE
  is '����';
comment on column T_RECEIVABLE_DETAIL.TOTALMONEY
  is 'ԭ�����';
comment on column T_RECEIVABLE_DETAIL.DISCOUNTMONEY
  is '���ý��';
comment on column T_RECEIVABLE_DETAIL.OFFSET
  is '�����';
comment on column T_RECEIVABLE_DETAIL.NOWLEFT
  is '�������';
comment on column T_RECEIVABLE_DETAIL.OFFSETMONEY
  is '��ֽ��';
comment on column T_RECEIVABLE_DETAIL.CUSTID
  is '���׶���,�ͻ�';
comment on column T_RECEIVABLE_DETAIL.CUSTNAME
  is '���׶�������';
comment on column T_RECEIVABLE_DETAIL.DEPTID
  is '���ű��';
comment on column T_RECEIVABLE_DETAIL.DEPARTNAME
  is '��������';
comment on column T_RECEIVABLE_DETAIL.PERSONNAME
  is 'ҵ����Ա';
comment on column T_RECEIVABLE_DETAIL.ADDFIELD1
  is '�Զ���һ';
comment on column T_RECEIVABLE_DETAIL.ADDFIELD2
  is '�Զ����';
comment on column T_RECEIVABLE_DETAIL.MEMO
  is '��ע';
alter table T_RECEIVABLE_DETAIL
  add primary key (FUNDBILLID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RECEIVABLE_DETAIL
  add foreign key (FUNDBILLID)
  references T_RECEIVABLE (FUNDBILLID);

prompt Creating T_STOREHOUSE...
create table T_STOREHOUSE
(
  WAREHOUSEID      NUMBER not null,
  WAREHOUSENAME    VARCHAR2(40) not null,
  SHORTNAME        VARCHAR2(40),
  ENGNAME          VARCHAR2(40),
  LINKNAME         VARCHAR2(40),
  TELEPHONE        VARCHAR2(40),
  WAREHOUSEADDRESS VARCHAR2(400),
  MEMO             VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_STOREHOUSE.WAREHOUSEID
  is '�ֿ���';
comment on column T_STOREHOUSE.WAREHOUSENAME
  is '�ֿ�����';
comment on column T_STOREHOUSE.SHORTNAME
  is '�ֿ���';
comment on column T_STOREHOUSE.ENGNAME
  is 'Ӣ������';
comment on column T_STOREHOUSE.LINKNAME
  is '��ϵ��';
comment on column T_STOREHOUSE.TELEPHONE
  is '��ϵ�˵绰';
comment on column T_STOREHOUSE.WAREHOUSEADDRESS
  is '�ֿ��ַ';
comment on column T_STOREHOUSE.MEMO
  is '��ע';
alter table T_STOREHOUSE
  add constraint WAREHOUSEID_PK primary key (WAREHOUSEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_REQUISITION...
create table T_REQUISITION
(
  BILLNO    VARCHAR2(20) not null,
  CALL_OUT  NUMBER,
  CALL_IN   NUMBER,
  BILLDATE  DATE not null,
  MAKER     VARCHAR2(20),
  PERMITTER VARCHAR2(20),
  REMARK    VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_REQUISITION.BILLNO
  is '���ݱ��';
comment on column T_REQUISITION.CALL_OUT
  is '�����ֿ�';
comment on column T_REQUISITION.CALL_IN
  is '����Ӳֿ�';
comment on column T_REQUISITION.BILLDATE
  is '��������';
comment on column T_REQUISITION.MAKER
  is '�Ƶ���Ա';
comment on column T_REQUISITION.PERMITTER
  is '������Ա';
comment on column T_REQUISITION.REMARK
  is '��ע';
alter table T_REQUISITION
  add primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_REQUISITION
  add constraint FK_RE_1 foreign key (CALL_OUT)
  references T_STOREHOUSE (WAREHOUSEID);
alter table T_REQUISITION
  add constraint FK_RE_2 foreign key (CALL_IN)
  references T_STOREHOUSE (WAREHOUSEID);

prompt Creating T_REQUISITION_DETAIL...
create table T_REQUISITION_DETAIL
(
  BILLNO      VARCHAR2(20) not null,
  LINID       INTEGER not null,
  PRODID      VARCHAR2(50) not null,
  PRODNAME    VARCHAR2(50) not null,
  PRODSIZE    VARCHAR2(50),
  STDUNITNAME VARCHAR2(20),
  SUMS        NUMBER,
  LOT_NUMBER  VARCHAR2(20),
  REMARK      VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_REQUISITION_DETAIL.BILLNO
  is '���ݱ��';
comment on column T_REQUISITION_DETAIL.LINID
  is '�к�';
comment on column T_REQUISITION_DETAIL.PRODID
  is '���ϱ��';
comment on column T_REQUISITION_DETAIL.PRODNAME
  is '��������';
comment on column T_REQUISITION_DETAIL.PRODSIZE
  is '����ͺ�';
comment on column T_REQUISITION_DETAIL.STDUNITNAME
  is '��λ����';
comment on column T_REQUISITION_DETAIL.SUMS
  is '����';
comment on column T_REQUISITION_DETAIL.LOT_NUMBER
  is '����';
comment on column T_REQUISITION_DETAIL.REMARK
  is '��ע';
alter table T_REQUISITION_DETAIL
  add primary key (BILLNO, LINID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_REQUISITION_DETAIL
  add constraint FK_RE_DE_1 foreign key (BILLNO)
  references T_REQUISITION (BILLNO);

prompt Creating T_RUSHPRICE_HOST...
create table T_RUSHPRICE_HOST
(
  RUSHPRICEHOSTID  NUMBER(10) not null,
  FUNDBILLID       VARCHAR2(30),
  FUNDBILLDATE     DATE,
  CUSTOMERID       NUMBER(10),
  CURR             VARCHAR2(10),
  CASHID_ONE       NUMBER(10),
  CASHID_TWO       NUMBER(10),
  CASHID_THREE     NUMBER(10),
  CASH_ONE_PRICE   NUMBER(10,2),
  CASH_TWO_PRICE   NUMBER(10,2),
  CASH_THREE_PRICE NUMBER(10,2),
  CASHSUMPRICE     NUMBER(10,2),
  EXCHRATE         NUMBER(10,2),
  DISCOUNTPER      NUMBER(10,2),
  ACCMONTHTOMONTH  DATE,
  DEPARTID         NUMBER(10),
  MAKERSIGN        VARCHAR2(30),
  PERMITTERSIGN    VARCHAR2(30),
  STATUS           NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_RUSHPRICE_HOST
  is 'Ӧ��������';
comment on column T_RUSHPRICE_HOST.RUSHPRICEHOSTID
  is 'Ӧ�������';
comment on column T_RUSHPRICE_HOST.FUNDBILLID
  is '��Դ����';
comment on column T_RUSHPRICE_HOST.FUNDBILLDATE
  is '��������';
comment on column T_RUSHPRICE_HOST.CUSTOMERID
  is '��Ӧ��ID';
comment on column T_RUSHPRICE_HOST.CURR
  is '�ұ�';
comment on column T_RUSHPRICE_HOST.CASHID_ONE
  is 'Ӧ�����㷽ʽһ';
comment on column T_RUSHPRICE_HOST.CASHID_TWO
  is 'Ӧ�����㷽ʽ��';
comment on column T_RUSHPRICE_HOST.CASHID_THREE
  is 'Ӧ�����㷽ʽ��';
comment on column T_RUSHPRICE_HOST.CASH_ONE_PRICE
  is 'Ӧ�����㷽ʽһ���';
comment on column T_RUSHPRICE_HOST.CASH_TWO_PRICE
  is 'Ӧ�����㷽ʽ�����';
comment on column T_RUSHPRICE_HOST.CASH_THREE_PRICE
  is 'Ӧ�����㷽ʽ�����';
comment on column T_RUSHPRICE_HOST.CASHSUMPRICE
  is 'Ӧ�������ܽ��';
comment on column T_RUSHPRICE_HOST.EXCHRATE
  is '����';
comment on column T_RUSHPRICE_HOST.DISCOUNTPER
  is '�ۿ���';
comment on column T_RUSHPRICE_HOST.ACCMONTHTOMONTH
  is '��ֹ����';
comment on column T_RUSHPRICE_HOST.DEPARTID
  is '��������ID';
comment on column T_RUSHPRICE_HOST.MAKERSIGN
  is '�Ƶ���Ա';
comment on column T_RUSHPRICE_HOST.PERMITTERSIGN
  is '������Ա';
comment on column T_RUSHPRICE_HOST.STATUS
  is '����״̬';
alter table T_RUSHPRICE_HOST
  add constraint PK_CASHID primary key (RUSHPRICEHOSTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RUSHPRICE_HOST
  add constraint FK_RUSHPRIC_ONE foreign key (CASHID_ONE)
  references T_RUSHPRICE_CASH (CASHID);
alter table T_RUSHPRICE_HOST
  add constraint FK_RUSHPRIC_THREE foreign key (CASHID_THREE)
  references T_RUSHPRICE_CASH (CASHID);
alter table T_RUSHPRICE_HOST
  add constraint FK_RUSHPRIC_TWO foreign key (CASHID_TWO)
  references T_RUSHPRICE_CASH (CASHID);

prompt Creating T_RUSHPRICE_CONTENT...
create table T_RUSHPRICE_CONTENT
(
  LINENO             NUMBER(11) not null,
  RUSHPRICECONTENTID NUMBER(11) not null,
  BILLTYPE           VARCHAR2(30),
  ORDERNO            VARCHAR2(30),
  FUNDBILLDATE       DATE,
  CUSTSHORTNAME      VARCHAR2(10),
  CUSTOMERNAME       VARCHAR2(20),
  DEPARTID           NUMBER(10),
  DEPARTNAME         VARCHAR2(20),
  PERSONNAME         VARCHAR2(20),
  CURR               VARCHAR2(10),
  EXCHRATE           NUMBER(10,2),
  TOTAL              NUMBER(10,2),
  NOWLEFT            NUMBER(10,2),
  DISCOUNT           NUMBER(10,2),
  OFFSET             NUMBER(10,2),
  OFFSETMONEY        NUMBER(10,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_RUSHPRICE_CONTENT
  is 'Ӧ�������ݱ�';
comment on column T_RUSHPRICE_CONTENT.RUSHPRICECONTENTID
  is '���ݱ���';
comment on column T_RUSHPRICE_CONTENT.BILLTYPE
  is '��Դ����';
comment on column T_RUSHPRICE_CONTENT.ORDERNO
  is '��Դ����';
comment on column T_RUSHPRICE_CONTENT.FUNDBILLDATE
  is 'ԭ����������';
comment on column T_RUSHPRICE_CONTENT.CUSTSHORTNAME
  is '���׶���(���)';
comment on column T_RUSHPRICE_CONTENT.CUSTOMERNAME
  is '���׶�������';
comment on column T_RUSHPRICE_CONTENT.DEPARTID
  is '���ű��';
comment on column T_RUSHPRICE_CONTENT.DEPARTNAME
  is '��������';
comment on column T_RUSHPRICE_CONTENT.PERSONNAME
  is '�ɹ���Ա';
comment on column T_RUSHPRICE_CONTENT.CURR
  is '�ұ�';
comment on column T_RUSHPRICE_CONTENT.EXCHRATE
  is '����';
comment on column T_RUSHPRICE_CONTENT.TOTAL
  is 'ԭ�����';
comment on column T_RUSHPRICE_CONTENT.NOWLEFT
  is '�������';
comment on column T_RUSHPRICE_CONTENT.DISCOUNT
  is '���ý��';
comment on column T_RUSHPRICE_CONTENT.OFFSET
  is '�����';
comment on column T_RUSHPRICE_CONTENT.OFFSETMONEY
  is '��ֽ��';
alter table T_RUSHPRICE_CONTENT
  add constraint PK_CASHIDDD primary key (RUSHPRICECONTENTID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RUSHPRICE_CONTENT
  add constraint FK_CONTENT_RUSHPRICECONTENTIDS foreign key (RUSHPRICECONTENTID)
  references T_RUSHPRICE_HOST (RUSHPRICEHOSTID);

prompt Creating T_RUSHPRICE_TAKE...
create table T_RUSHPRICE_TAKE
(
  LINENO          NUMBER(11) not null,
  RUSHPRICETAKEID NUMBER(11) not null,
  BILLTYPE        VARCHAR2(30),
  ORDERNO         VARCHAR2(30),
  DEPARTID        NUMBER(10),
  DEPARTNAME      VARCHAR2(30),
  ORIGADDPREPAY   NUMBER(10,2),
  DESCRIPTION     VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table T_RUSHPRICE_TAKE
  is 'Ӧ����ȡ��Ԥ����';
comment on column T_RUSHPRICE_TAKE.RUSHPRICETAKEID
  is 'ȡ��Ԥ������ID';
comment on column T_RUSHPRICE_TAKE.BILLTYPE
  is '��Դ����';
comment on column T_RUSHPRICE_TAKE.ORDERNO
  is '��Դ����';
comment on column T_RUSHPRICE_TAKE.DEPARTID
  is '���ű��';
comment on column T_RUSHPRICE_TAKE.DEPARTNAME
  is '��������';
comment on column T_RUSHPRICE_TAKE.ORIGADDPREPAY
  is 'ȡ��Ԥ�����';
comment on column T_RUSHPRICE_TAKE.DESCRIPTION
  is '��ԴժҪ';
alter table T_RUSHPRICE_TAKE
  add constraint XXAA primary key (RUSHPRICETAKEID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_RUSHPRICE_TAKE
  add constraint FK_TAKE_RUSHPRICETAKEID foreign key (RUSHPRICETAKEID)
  references T_RUSHPRICE_HOST (RUSHPRICEHOSTID);

prompt Creating T_SALESRETURN...
create table T_SALESRETURN
(
  CUSTID               VARCHAR2(50) not null,
  BILLDATE             DATE,
  DELIVERYADDRESS      VARCHAR2(50),
  BILLNO               VARCHAR2(50) not null,
  PRICEOFTAX           VARCHAR2(50),
  CURRENCYNAME         VARCHAR2(50),
  WAREHOUSEID          VARCHAR2(50),
  EXCHANGERATE         NUMBER,
  ISREOUTOFTHETREASURY VARCHAR2(50),
  FOREIGNTRADE         VARCHAR2(50),
  DOCUMENTNUMBER       VARCHAR2(50),
  SALESID              VARCHAR2(50),
  PRODUCER             VARCHAR2(50),
  DEPARTED             VARCHAR2(50),
  REVIEWPERSONNEL      VARCHAR2(50),
  PROJECT              VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_SALESRETURN
  add primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_SALESRETURN_DETAIL...
create table T_SALESRETURN_DETAIL
(
  COLUMNNUMBER         VARCHAR2(50) not null,
  MATERIALNUMBER       VARCHAR2(50),
  MATERIALNAME         VARCHAR2(50),
  RULEMODEL            VARCHAR2(50),
  UNITNAME             VARCHAR2(50),
  NUMBER1              VARCHAR2(20),
  PREDISCOUNTUNITPRICE NUMBER,
  RATEOFDISCOUNT       NUMBER,
  UNITPRICE            NUMBER,
  AMOUNTOFMONEY        NUMBER,
  TAXRATE              NUMBER,
  TAXRATEMONEY         NUMBER,
  TAXAMOUNT            NUMBER,
  BATCHNUMBER          VARCHAR2(20),
  GIFT                 VARCHAR2(20),
  INVOICEDETAIL        VARCHAR2(20),
  UNPENEDINVOICENUMBER VARCHAR2(20),
  MEMONOTES            VARCHAR2(100),
  SOURCESINGLEBIE      VARCHAR2(50),
  BILLNO               VARCHAR2(20) not null,
  SOUECESINGLENUMBER   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_SALESRETURN_DETAIL
  add primary key (BILLNO, COLUMNNUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_SALESRETURN_DETAIL
  add constraint SALESRETURN_OF_DETAIL foreign key (BILLNO)
  references T_SALESRETURN (BILLNO);

prompt Creating T_SET_RECEIVABLEL...
create table T_SET_RECEIVABLEL
(
  FUNDBILLID         VARCHAR2(20) not null,
  LINEID             VARCHAR2(20) not null,
  FUNDBILLID_RECEIBE VARCHAR2(20),
  SOURCESORTING      VARCHAR2(20) not null,
  ORGINBILLNO        VARCHAR2(20) not null,
  DEPTID             VARCHAR2(20) not null,
  DEPARTNAME         VARCHAR2(20) not null,
  SETMONEY           NUMBER(10,2),
  ABSTRACTS          VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_SET_RECEIVABLEL.FUNDBILLID
  is '���ݱ�Ź������۳��ⵥ';
comment on column T_SET_RECEIVABLEL.LINEID
  is '�к�';
comment on column T_SET_RECEIVABLEL.FUNDBILLID_RECEIBE
  is 'Ӧ�ճ�����';
comment on column T_SET_RECEIVABLEL.SOURCESORTING
  is '��Դ��Ԥ�տ��';
comment on column T_SET_RECEIVABLEL.ORGINBILLNO
  is '��Դ����';
comment on column T_SET_RECEIVABLEL.DEPTID
  is '���ű��';
comment on column T_SET_RECEIVABLEL.DEPARTNAME
  is '��������';
comment on column T_SET_RECEIVABLEL.SETMONEY
  is 'ȡ��Ԥ�ս��';
comment on column T_SET_RECEIVABLEL.ABSTRACTS
  is '��ԴժҪ';
alter table T_SET_RECEIVABLEL
  add primary key (FUNDBILLID, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_STOCKOUT_SON...
create table T_STOCKOUT_SON
(
  BILLID         VARCHAR2(20) not null,
  LINE           NUMBER not null,
  PRODID         VARCHAR2(20) not null,
  SUM            NUMBER not null,
  BEFOREPRICE    NUMBER(10,2) not null,
  RATEOFDISCOUNT NUMBER(10,2) not null,
  LASTPRICE      NUMBER(10,2) not null,
  PRICE          NUMBER(10,2) not null,
  TAXATE         NUMBER(10,2) not null,
  TAXATEPRICE    NUMBER(10,2) not null,
  SUMPRICE       NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_STOCKOUT_SON.BILLID
  is '���۶������';
comment on column T_STOCKOUT_SON.LINE
  is '�к�';
comment on column T_STOCKOUT_SON.PRODID
  is '���ϱ��';
comment on column T_STOCKOUT_SON.SUM
  is '����';
comment on column T_STOCKOUT_SON.BEFOREPRICE
  is '�ۿ�ǰ����';
comment on column T_STOCKOUT_SON.RATEOFDISCOUNT
  is '����';
comment on column T_STOCKOUT_SON.LASTPRICE
  is '����';
comment on column T_STOCKOUT_SON.PRICE
  is '���';
comment on column T_STOCKOUT_SON.TAXATE
  is '˰��';
comment on column T_STOCKOUT_SON.TAXATEPRICE
  is '˰��';
comment on column T_STOCKOUT_SON.SUMPRICE
  is '��˰���';
alter table T_STOCKOUT_SON
  add primary key (BILLID, LINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_STOCKOUT_SON
  add constraint ���ó��ⵥ�� foreign key (BILLID)
  references T_STOCKOUT_MAIN (BILLID);
alter table T_STOCKOUT_SON
  add constraint �������� foreign key (PRODID)
  references T_PROD_MAIN (PRODID);

prompt Creating T_STORE_ADJUST_MAIN...
create table T_STORE_ADJUST_MAIN
(
  FLAG          NUMBER(4) not null,
  ADJUSTNO      VARCHAR2(14) not null,
  ADJUSTDATE    DATE not null,
  ADJUSTSTYLE   VARCHAR2(6) not null,
  MAKER         VARCHAR2(10) not null,
  PERMITTER     VARCHAR2(10) not null,
  VOUCHERNO     VARCHAR2(15) not null,
  SUMQTY        NUMBER(10,2) not null,
  SUMCOST       NUMBER(10,2) not null,
  REMARK        VARCHAR2(400) not null,
  MERGEOUTSTATE NUMBER(4) not null,
  DEPARTID      NUMBER(10) not null,
  MAKERID       NUMBER(10) not null,
  PERMITTERID   NUMBER(10) not null,
  HASCHECK      NUMBER(4) not null,
  WAREID        NUMBER(10) not null,
  SALESID       VARCHAR2(10) not null,
  BILLSTATUS    NUMBER(4) not null,
  ZEROFILTER    NUMBER(4) not null,
  SUMCURQTY     NUMBER(10,2) not null,
  SUMCHECKQTY   NUMBER(10,2) not null,
  INCSUBJECTID  NUMBER(10) not null,
  DECSUJECTID   NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_STORE_ADJUST_MAIN
  add constraint PK_STORE_AJUST_MAIN primary key (ADJUSTNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_STORE_ADJUST_SUB...
create table T_STORE_ADJUST_SUB
(
  FLAG       NUMBER(4) not null,
  ADJUSTNO   VARCHAR2(14) not null,
  ROWNO      NUMBER(4) not null,
  SERNO      NUMBER(10) not null,
  ADJUSTDATE DATE not null,
  PRICE      NUMBER(10,2) not null,
  AMOUNT     NUMBER(10,2) not null,
  HAVEBATCH  NUMBER(10) not null,
  ITEMREMARK VARCHAR2(400) not null,
  CURQTY     NUMBER(10,2) not null,
  CHECKQTY   NUMBER(10,2) not null,
  PRODID     NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_STORE_ADJUST_SUB
  add constraint PK_STORE_AJUST_SUB primary key (ADJUSTNO, ROWNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_STORE_IO...
create table T_STORE_IO
(
  FLAG         NUMBER(4) not null,
  BILLNO       VARCHAR2(14) not null,
  ROWNO        NUMBER(4) not null,
  SERNO        NUMBER(10) not null,
  PRODID       NUMBER(4) not null,
  PRODNAME     VARCHAR2(60) not null,
  COSTAVG      NUMBER(10,2) not null,
  QUANTITY     NUMBER(10,2) not null,
  QUANCOMB     NUMBER(10,2) not null,
  MLPRICE      NUMBER(10,2) not null,
  MLAMOUNT     NUMBER(10,2) not null,
  ADJUSTSTYLE  NUMBER(4) not null,
  WAREID       NUMBER(10) not null,
  QTYREMAIN    NUMBER(10) not null,
  FROMNO       VARCHAR2(14) not null,
  FROMROW      NUMBER(4) not null,
  TAXRATE      NUMBER(10,2) not null,
  PARENTROWNO  NUMBER(4) not null,
  TAXAMT       NUMBER(10,2) not null,
  HAVEBATCH    NUMBER(4) not null,
  NEEDUPDATE   NUMBER(4) not null,
  COSTFORACC   NUMBER(10,2) not null,
  HASCHECK     NUMBER(4) default 0,
  PRICE        NUMBER(10,2) not null,
  DISCOUNT     NUMBER(10,2) not null,
  AMOUNT       NUMBER(10,2) not null,
  ITEMREMARK   VARCHAR2(400) not null,
  SUNITID      NUMBER(10) not null,
  SQUANTITY    NUMBER(10,2) not null,
  UNITRELATION NUMBER(10,2) not null,
  EQUANTITY    NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_STORE_IO.BILLNO
  is '�����ˮ����';
alter table T_STORE_IO
  add constraint PK_BILLNO primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_TJIA_MAIN...
create table T_TJIA_MAIN
(
  ID           VARCHAR2(20) not null,
  ADJUSTDATE   DATE not null,
  BILLNO       VARCHAR2(255) not null,
  INCSUBJECTID VARCHAR2(255) not null,
  VOUCHARNO    VARCHAR2(255) not null,
  DECSUJECTID  VARCHAR2(255) not null,
  ADJUSTMENT   VARCHAR2(255) not null,
  MAKER        VARCHAR2(255) not null,
  PERMITTER    VARCHAR2(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_TJIA_MAIN.ID
  is '���ݱ��';
comment on column T_TJIA_MAIN.ADJUSTDATE
  is '��������';
comment on column T_TJIA_MAIN.BILLNO
  is '���ݺ���';
comment on column T_TJIA_MAIN.INCSUBJECTID
  is '��ֵ��Ŀ';
comment on column T_TJIA_MAIN.VOUCHARNO
  is 'ƾ֤���';
comment on column T_TJIA_MAIN.DECSUJECTID
  is '��ֵ��Ŀ';
comment on column T_TJIA_MAIN.ADJUSTMENT
  is '������ʽ';
comment on column T_TJIA_MAIN.MAKER
  is '�Ƶ���Ա';
comment on column T_TJIA_MAIN.PERMITTER
  is '������Ա';
alter table T_TJIA_MAIN
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_TJIA_DETAIL...
create table T_TJIA_DETAIL
(
  ID       VARCHAR2(20) not null,
  LINEID   VARCHAR2(255) not null,
  PRODID   VARCHAR2(255) not null,
  PRODNAME VARCHAR2(255) not null,
  PRODSIZE VARCHAR2(255) not null,
  PCS      VARCHAR2(255) not null,
  KCCOUNT  NUMBER not null,
  AVGCBEN  NUMBER(8,2) not null,
  PRICE    NUMBER(8,2) not null,
  TJJINE   NUMBER(8,2) not null,
  FLBEIZHU VARCHAR2(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_TJIA_DETAIL.ID
  is '���ݱ��';
comment on column T_TJIA_DETAIL.LINEID
  is '�к�';
comment on column T_TJIA_DETAIL.PRODID
  is '���ϱ��';
comment on column T_TJIA_DETAIL.PRODNAME
  is '��������';
comment on column T_TJIA_DETAIL.PRODSIZE
  is '����ͺ�';
comment on column T_TJIA_DETAIL.PCS
  is '��λ';
comment on column T_TJIA_DETAIL.KCCOUNT
  is '�����';
comment on column T_TJIA_DETAIL.AVGCBEN
  is 'ƽ���ɱ�';
comment on column T_TJIA_DETAIL.PRICE
  is '����';
comment on column T_TJIA_DETAIL.TJJINE
  is '���۽��';
comment on column T_TJIA_DETAIL.FLBEIZHU
  is '��¼��ע';
alter table T_TJIA_DETAIL
  add primary key (ID, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_TJIA_DETAIL
  add constraint WAI1 foreign key (ID)
  references T_TJIA_MAIN (ID);

prompt Creating T_UNTIL...
create table T_UNTIL
(
  UNTILID   NUMBER not null,
  UNTILNAME VARCHAR2(20) not null,
  ENGNAME   VARCHAR2(20),
  MEMO      VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_UNTIL.UNTILID
  is '��λ���';
comment on column T_UNTIL.UNTILNAME
  is '��λ����';
comment on column T_UNTIL.ENGNAME
  is 'Ӣ������';
comment on column T_UNTIL.MEMO
  is '��ע';
alter table T_UNTIL
  add constraint UNTILID_PK primary key (UNTILID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_WARE_ALL...
create table T_WARE_ALL
(
  WAREHOUSEID VARCHAR2(10) not null,
  PRODID      VARCHAR2(20) not null,
  SUM         NUMBER not null,
  ONEPRICE    NUMBER(10,2) not null,
  SUMPRICE    NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_WARE_ALL.WAREHOUSEID
  is '�ֿ�ID';
comment on column T_WARE_ALL.PRODID
  is '����ID';
comment on column T_WARE_ALL.SUM
  is '����';
comment on column T_WARE_ALL.ONEPRICE
  is '���ۣ�����ƽ���ɱ���';
comment on column T_WARE_ALL.SUMPRICE
  is '������*������';
alter table T_WARE_ALL
  add constraint �����ֿ� foreign key (WAREHOUSEID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_WARE_ALL
  add constraint �������� foreign key (PRODID)
  references T_PROD_MAIN (PRODID);

prompt Creating T_WARE_PRICE...
create table T_WARE_PRICE
(
  WAREHOUSEID VARCHAR2(10) not null,
  PRODID      VARCHAR2(20) not null,
  BILLID      VARCHAR2(20) not null,
  LINE        NUMBER not null,
  BILLTYPEID  VARCHAR2(10) not null,
  SUM         NUMBER not null,
  ONEPRICE    NUMBER(10,2) not null,
  SUMPRICE    NUMBER(10,2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_WARE_PRICE.WAREHOUSEID
  is '�ֿ�ID';
comment on column T_WARE_PRICE.PRODID
  is '����ID';
comment on column T_WARE_PRICE.BILLID
  is '����ID';
comment on column T_WARE_PRICE.LINE
  is '�к�';
comment on column T_WARE_PRICE.BILLTYPEID
  is '��������ID';
comment on column T_WARE_PRICE.SUM
  is '����';
comment on column T_WARE_PRICE.ONEPRICE
  is '����';
comment on column T_WARE_PRICE.SUMPRICE
  is '������*������';
alter table T_WARE_PRICE
  add constraint �ֿ���� foreign key (WAREHOUSEID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_WARE_PRICE
  add constraint ������� foreign key (PRODID)
  references T_PROD_MAIN (PRODID);

prompt Creating T_XSHOU_MAIN...
create table T_XSHOU_MAIN
(
  ID              VARCHAR2(20) not null,
  CUSTOMERID      VARCHAR2(255) not null,
  BILLDATE        DATE not null,
  BILLNO          VARCHAR2(255) not null,
  ADDRESSID       VARCHAR2(255) not null,
  BILLSTYLEID     VARCHAR2(255) not null,
  CUSTBILLNO      VARCHAR2(255) not null,
  PRICEOFTAX      VARCHAR2(255) not null,
  CURCURRENCYNAME VARCHAR2(255) not null,
  EXCHRATE        NUMBER not null,
  BILLSTATUS      VARCHAR2(255) not null,
  SALESNAME       VARCHAR2(255) not null,
  MAKER           VARCHAR2(255) not null,
  DEPARTNAME      VARCHAR2(255) not null,
  PERMITTER       VARCHAR2(255) not null,
  PROJECTNAME     VARCHAR2(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_XSHOU_MAIN.ID
  is '���ݱ��';
comment on column T_XSHOU_MAIN.CUSTOMERID
  is '�ͻ�';
comment on column T_XSHOU_MAIN.BILLDATE
  is '��������';
comment on column T_XSHOU_MAIN.BILLNO
  is '���ݺ���';
comment on column T_XSHOU_MAIN.ADDRESSID
  is '�ͻ���ַ';
comment on column T_XSHOU_MAIN.BILLSTYLEID
  is '���۶�������';
comment on column T_XSHOU_MAIN.CUSTBILLNO
  is '�ͻ�����';
comment on column T_XSHOU_MAIN.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column T_XSHOU_MAIN.CURCURRENCYNAME
  is '�ұ�';
comment on column T_XSHOU_MAIN.EXCHRATE
  is '����';
comment on column T_XSHOU_MAIN.BILLSTATUS
  is '����';
comment on column T_XSHOU_MAIN.SALESNAME
  is 'ҵ����Ա';
comment on column T_XSHOU_MAIN.MAKER
  is '�Ƶ���Ա';
comment on column T_XSHOU_MAIN.DEPARTNAME
  is '��������';
comment on column T_XSHOU_MAIN.PERMITTER
  is '������Ա';
comment on column T_XSHOU_MAIN.PROJECTNAME
  is '��������';
alter table T_XSHOU_MAIN
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_XSHOU_DETAIL...
create table T_XSHOU_DETAIL
(
  ID       VARCHAR2(20) not null,
  LINEID   VARCHAR2(255) not null,
  PRODNAME VARCHAR2(255) not null,
  PRODID   VARCHAR2(20) not null,
  PRODSIZE VARCHAR2(255) not null,
  PCS      VARCHAR2(255) not null,
  SUM      NUMBER not null,
  ORDPRICE NUMBER(8,2) not null,
  ZSHU     NUMBER(8,2) not null,
  PRICE    NUMBER(8,2) not null,
  MONEY    NUMBER(8,2) not null,
  SLU      NUMBER not null,
  SMONEY   NUMBER(8,2) not null,
  HSMONEY  NUMBER(8,2) not null,
  YCKR     DATE not null,
  WCSUM    NUMBER not null,
  ZPIN     VARCHAR2(255) not null,
  ZPBEIZHU VARCHAR2(255) not null,
  WLZUHE   VARCHAR2(255) not null,
  LYDANBIE VARCHAR2(255) not null,
  LYDANHAO VARCHAR2(255) not null,
  SCHAN    VARCHAR2(255) not null,
  PCDANHAO VARCHAR2(255) not null,
  YPCSUM   NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_XSHOU_DETAIL.ID
  is '���ݱ��';
comment on column T_XSHOU_DETAIL.LINEID
  is '�к�';
comment on column T_XSHOU_DETAIL.PRODNAME
  is '��������';
comment on column T_XSHOU_DETAIL.PRODID
  is '���ϱ��';
comment on column T_XSHOU_DETAIL.PRODSIZE
  is '����ͺ�';
comment on column T_XSHOU_DETAIL.PCS
  is '��λ����';
comment on column T_XSHOU_DETAIL.SUM
  is '����';
comment on column T_XSHOU_DETAIL.ORDPRICE
  is '�ۿ�ǰ����';
comment on column T_XSHOU_DETAIL.ZSHU
  is '����';
comment on column T_XSHOU_DETAIL.PRICE
  is '����';
comment on column T_XSHOU_DETAIL.MONEY
  is '���';
comment on column T_XSHOU_DETAIL.SLU
  is '˰��';
comment on column T_XSHOU_DETAIL.SMONEY
  is '˰��';
comment on column T_XSHOU_DETAIL.HSMONEY
  is '��˰���';
comment on column T_XSHOU_DETAIL.YCKR
  is 'Ԥ������';
comment on column T_XSHOU_DETAIL.WCSUM
  is 'δ������';
comment on column T_XSHOU_DETAIL.ZPIN
  is '��Ʒ';
comment on column T_XSHOU_DETAIL.ZPBEIZHU
  is '��¼��ע';
comment on column T_XSHOU_DETAIL.WLZUHE
  is '�������';
comment on column T_XSHOU_DETAIL.LYDANBIE
  is '��Դ����';
comment on column T_XSHOU_DETAIL.LYDANHAO
  is '��Դ����';
comment on column T_XSHOU_DETAIL.SCHAN
  is '����';
comment on column T_XSHOU_DETAIL.PCDANHAO
  is '�Ų�����';
comment on column T_XSHOU_DETAIL.YPCSUM
  is '���Ų�����';
alter table T_XSHOU_DETAIL
  add primary key (ID, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_XSHOU_DETAIL
  add constraint WAI foreign key (ID)
  references T_XSHOU_MAIN (ID);

prompt Disabling foreign key constraints for PURCHASING_TOWARE_DETAILS...
alter table PURCHASING_TOWARE_DETAILS disable constraint FK_PERMITTER;
prompt Disabling foreign key constraints for STAFF_MASTER_FILE...
alter table STAFF_MASTER_FILE disable constraint FK_DEPARTMENTID;
prompt Disabling foreign key constraints for T_CUSTOMER...
alter table T_CUSTOMER disable constraint FK_CU_1;
prompt Disabling foreign key constraints for T_STOCKOUT_MAIN...
alter table T_STOCKOUT_MAIN disable constraint �ͻ����;
alter table T_STOCKOUT_MAIN disable constraint �����;
alter table T_STOCKOUT_MAIN disable constraint ҵ����Ա;
alter table T_STOCKOUT_MAIN disable constraint ���òֿ�;
alter table T_STOCKOUT_MAIN disable constraint �Ƶ���;
prompt Disabling foreign key constraints for T_ACCOUNT_SON...
alter table T_ACCOUNT_SON disable constraint ���ⵥ�����;
alter table T_ACCOUNT_SON disable constraint �ͻ�ID;
prompt Disabling foreign key constraints for T_ACCOUNT_WATER...
alter table T_ACCOUNT_WATER disable constraint �������;
prompt Disabling foreign key constraints for T_ADVANCE_HOST...
alter table T_ADVANCE_HOST disable constraint FK_CASHID_ONE;
alter table T_ADVANCE_HOST disable constraint FK_CASHID_THREE;
alter table T_ADVANCE_HOST disable constraint FK_CASHID_TWO;
prompt Disabling foreign key constraints for T_ADVANCE_DETAILS...
alter table T_ADVANCE_DETAILS disable constraint FK_DETAILS_DETAILSID;
prompt Disabling foreign key constraints for T_CUSTOM_ADDRESS_DETAIL...
alter table T_CUSTOM_ADDRESS_DETAIL disable constraint FK_CU_DE_1;
prompt Disabling foreign key constraints for T_PROD_MAIN...
alter table T_PROD_MAIN disable constraint �������;
prompt Disabling foreign key constraints for T_QUOTATION...
alter table T_QUOTATION disable constraint FK_QU_1;
alter table T_QUOTATION disable constraint FK_QU_2;
alter table T_QUOTATION disable constraint FK_QU_3;
alter table T_QUOTATION disable constraint FK_QU_4;
prompt Disabling foreign key constraints for T_QUOTATION_DETAIL...
alter table T_QUOTATION_DETAIL disable constraint FK_QU_DE_1;
alter table T_QUOTATION_DETAIL disable constraint FK_QU_DE_2;
prompt Disabling foreign key constraints for T_RECEIVABLE_ADVANCE...
alter table T_RECEIVABLE_ADVANCE disable constraint RECEADVANCE_FK_CUSTOMER;
alter table T_RECEIVABLE_ADVANCE disable constraint RECEADVANCE_FK_DEPART;
prompt Disabling foreign key constraints for T_RECEIVABLEADVANCE_DETAIL...
alter table T_RECEIVABLEADVANCE_DETAIL disable constraint SYS_C009828;
prompt Disabling foreign key constraints for T_RECEIVABLE_DETAIL...
alter table T_RECEIVABLE_DETAIL disable constraint SYS_C009846;
prompt Disabling foreign key constraints for T_REQUISITION...
alter table T_REQUISITION disable constraint FK_RE_1;
alter table T_REQUISITION disable constraint FK_RE_2;
prompt Disabling foreign key constraints for T_REQUISITION_DETAIL...
alter table T_REQUISITION_DETAIL disable constraint FK_RE_DE_1;
prompt Disabling foreign key constraints for T_RUSHPRICE_HOST...
alter table T_RUSHPRICE_HOST disable constraint FK_RUSHPRIC_ONE;
alter table T_RUSHPRICE_HOST disable constraint FK_RUSHPRIC_THREE;
alter table T_RUSHPRICE_HOST disable constraint FK_RUSHPRIC_TWO;
prompt Disabling foreign key constraints for T_RUSHPRICE_CONTENT...
alter table T_RUSHPRICE_CONTENT disable constraint FK_CONTENT_RUSHPRICECONTENTIDS;
prompt Disabling foreign key constraints for T_RUSHPRICE_TAKE...
alter table T_RUSHPRICE_TAKE disable constraint FK_TAKE_RUSHPRICETAKEID;
prompt Disabling foreign key constraints for T_SALESRETURN_DETAIL...
alter table T_SALESRETURN_DETAIL disable constraint SALESRETURN_OF_DETAIL;
prompt Disabling foreign key constraints for T_STOCKOUT_SON...
alter table T_STOCKOUT_SON disable constraint ���ó��ⵥ��;
alter table T_STOCKOUT_SON disable constraint ��������;
prompt Disabling foreign key constraints for T_TJIA_DETAIL...
alter table T_TJIA_DETAIL disable constraint WAI1;
prompt Disabling foreign key constraints for T_WARE_ALL...
alter table T_WARE_ALL disable constraint �����ֿ�;
alter table T_WARE_ALL disable constraint ��������;
prompt Disabling foreign key constraints for T_WARE_PRICE...
alter table T_WARE_PRICE disable constraint �ֿ����;
alter table T_WARE_PRICE disable constraint �������;
prompt Disabling foreign key constraints for T_XSHOU_DETAIL...
alter table T_XSHOU_DETAIL disable constraint WAI;
prompt Loading ADEEXES...
prompt Table is empty
prompt Loading APPORTIONDETAILS...
prompt Table is empty
prompt Loading APPORTIONRESULT...
prompt Table is empty
prompt Loading DEPART...
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (1, '�ɹ���', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (2, '���۲�', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (3, '�з���', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (4, '�г���', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (5, '������', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (111, '111', '111', '111');
commit;
prompt 6 records loaded
prompt Loading DOCUMENT_OFTYPE...
prompt Table is empty
prompt Loading D_TYPE...
insert into D_TYPE (ID, TYPENAME, ENAME)
values (1, '�ɹ��빺��', 'cgqgd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (2, '�ɹ�ѯ�۵�', 'cgxjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (3, '�ɹ�����', 'cgdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (4, '�ɹ���ⵥ', 'cgrkd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (5, '�ɹ��˻���', 'cgthd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (6, '�ɹ���̯��ҵ', 'cgftzy');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (7, '����ѯ�۵�', 'xsxjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (8, '���۶���', 'xsdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (9, '���۳��ⵥ', 'xsckd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (10, '�����˻���', 'xsthd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (11, '�̵㵥', 'pdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (12, '������', 'dbd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (13, '���۵�', 'tjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (14, 'Ӧ�ճ�', 'ysckd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (15, 'Ӧ����', 'yfckd');
commit;
prompt 15 records loaded
prompt Loading MONEYTYPE...
prompt Table is empty
prompt Loading NAME...
insert into NAME (NAME)
values ('aaaaaa');
insert into NAME (NAME)
values ('weqwewq');
insert into NAME (NAME)
values ('sadzx');
insert into NAME (NAME)
values ('dsadxzzdsae');
commit;
prompt 4 records loaded
prompt Loading PURCHASE_RETURN...
prompt Table is empty
prompt Loading PURCHASE_RETURN_DETAIL...
prompt Table is empty
prompt Loading PURCHASING_TOWARE...
prompt Table is empty
prompt Loading PURCHASING_TOWARE_DETAILS...
prompt Table is empty
prompt Loading STAFF_MASTER_FILE...
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('10001', 1, 'С��', '0', null, '432123434444', to_date('02-02-1997', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('10002', 2, 'С��', '0', null, '432123434441', to_date('02-04-1996', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1003', 3, 'С��', '1', null, '432123431414', to_date('12-06-1997', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1004', 4, 'СҶ', '1', null, '432123434124', to_date('15-08-1996', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1005', 5, 'С��', '0', null, '432123442121', to_date('12-12-1995', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 5 records loaded
prompt Loading STOCKAPPRTION...
prompt Table is empty
prompt Loading SUPPLIERS...
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('CSXL', '3', 'CSXL', '��ɳ�����������޹�˾', '��ɳ����', 'ŷ����', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('HP', '1', 'HP', '����(�й�)���޹�˾', '����', '��ɹ�', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('SHJJ', '1', 'SHJJ', '�Ϻ��ѽ����޹�˾', '�Ϻ��ѽ�', '��ɹ�', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('SZSM', '1', 'SZSM', '���������������޹�˾', '��������', '��ɹ�', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 4 records loaded
prompt Loading SUPPLIERS_ACCOUNT_DETAIL...
prompt Table is empty
prompt Loading SUPPLIERS_ADDRESS...
prompt Table is empty
prompt Loading SUPPLIERS_TYPE...
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('1', '��Ҫ', 'zygys', '��Ҫ��Ӧ��');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('2', 'һ��', 'ybgys', 'һ�㹩Ӧ��');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('3', 'ί�⳧', 'wwc', 'ί�⳧');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('4', '������Ӧ��', 'qtgys', '������Ӧ��');
commit;
prompt 4 records loaded
prompt Loading S_WATER_METER...
prompt Table is empty
prompt Loading T_CUSTOM_CLASS...
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('001', '��ͻ�', null, null, null);
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('002', '��ͨ�ͻ�', null, null, null);
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('003', 'VIP�ͻ�', null, null, null);
commit;
prompt 3 records loaded
prompt Loading T_CUSTOMER...
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('001', null, '����', '001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('002', null, '��С��', '002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('003', null, null, '002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('004', null, null, '002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('005', null, null, '003', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 5 records loaded
prompt Loading T_WARE_MAIN...
insert into T_WARE_MAIN (WAREHOUSEID, WAREHOUSENAME, ENGNAME, SHORTNAME, LINKNAME, TELEPHONE, WAREHOUSEADDRESS, MEMO)
values ('01', 'ԭ�ϲֿ�', 'YLCK', 'YLCK', '�˿�ΰ', '17377731279', '��������', '�ٱ���');
insert into T_WARE_MAIN (WAREHOUSEID, WAREHOUSENAME, ENGNAME, SHORTNAME, LINKNAME, TELEPHONE, WAREHOUSEADDRESS, MEMO)
values ('02', '���ڵ����ر���', 'YLCK', 'YLCK', '����', '17895621231', '�Ϻ�', '���ֿ�����');
commit;
prompt 2 records loaded
prompt Loading T_STOCKOUT_MAIN...
insert into T_STOCKOUT_MAIN (BILLID, BILLDATE, BILLSTATUS, AUDITORID, DOCUMENTMAKERID, BUSINESSID, SUMAMTATAX, SUMNUM, SUMPRICE, CURRNAME, GATHERMONTH, GATHERSTYLE, GATHERDELAY, SALECLASSID, DELIVERYADDRESS, WAREID, CUSTID, TELEPHONE1, TELEPHONE2, MEMO)
values ('20180615001', to_date('15-06-2018', 'dd-mm-yyyy'), 'δ���', null, '1003', '1003', 8000, 2, 7000, '�����', '6', '��������', 0, '0', '��������', '02', '002', '17377731279', null, 'M24��');
commit;
prompt 1 records loaded
prompt Loading T_ACCOUNT_SON...
prompt Table is empty
prompt Loading T_ACCOUNT_WATER...
prompt Table is empty
prompt Loading T_RUSHPRICE_CASH...
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (1, 'ת��');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (2, '��Ʊ');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (3, '����');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (4, '����');
commit;
prompt 4 records loaded
prompt Loading T_ADVANCE_HOST...
prompt Table is empty
prompt Loading T_ADVANCE_DETAILS...
prompt Table is empty
prompt Loading T_BUY...
prompt Table is empty
prompt Loading T_BUY_DETAILS...
prompt Table is empty
prompt Loading T_BUY_INQUIRY...
prompt Table is empty
prompt Loading T_BUY_INQUIRY_DETAILS...
prompt Table is empty
prompt Loading T_CUSTOM_ADDRESS_DETAIL...
insert into T_CUSTOM_ADDRESS_DETAIL (CUSTID, ADDRESSCODE, ADDRESS, YOUZCODING, LINKMAN, LINKMANNAME, TELEPHONE, FAXNO, WALKINGROUTE, MEMO)
values ('001', '001', '��������', '412000', null, null, '12345678901', null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_ORDER_BILL_MAIN...
insert into T_ORDER_BILL_MAIN (FLAG, BILLNO, BILLDATE, CUSTOMERID, ADDRESSID, ZIPCODE, CUSTADDRESS, FORMALCUST, VALIDDATE, SALESMAN, DEPARTID, PROJECTID, CURRID, EXCHRATE, MAKER, PERMITTER, DETAIL, REMARK, ISTRANS, SUMBTAXAMT, TAXTYPE, SUMTAX, SUMQTY, BILLSTATUS, MERGEOUTSTATE, BILLSTYLEID, BILLSTYLENAME, SIGNBACK, HASCHECK)
values (1, '20180615', to_date('15-06-2018 08:30:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', '343332', '23424', '0', to_date('15-06-2018 08:31:43', 'dd-mm-yyyy hh24:mi:ss'), 'add', 1, 1, 1, 1, 3, 1, 3, 'asdf', 1, 324, 1, 3, 343, 1, 2, 3, 'sf', 1, 0);
commit;
prompt 1 records loaded
prompt Loading T_ORDER_BILL_SUB...
prompt Table is empty
prompt Loading T_PROD_PATTERN...
insert into T_PROD_PATTERN (CLASSID, CLASSNAME, ENGNAME, ACCINVENTTORYNAME, SENDOUTWARE, MEMO)
values ('BO1', '������װ��', null, '��װ��', '������Ʒ', null);
insert into T_PROD_PATTERN (CLASSID, CLASSNAME, ENGNAME, ACCINVENTTORYNAME, SENDOUTWARE, MEMO)
values ('BO3', '�����װ��', null, '��װ��', '������Ʒ', '����');
insert into T_PROD_PATTERN (CLASSID, CLASSNAME, ENGNAME, ACCINVENTTORYNAME, SENDOUTWARE, MEMO)
values ('BO2', '������װ��', null, '��װ��', '������Ʒ', null);
commit;
prompt 3 records loaded
prompt Loading T_PROD_MAIN...
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-307', 'BO3', '�����װ��', 'AWM', '�����', null, '�����', 1000, 1100, 1101, 1102, 1150, 1200, 500, 17, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('01-12-2018', 'dd-mm-yyyy'), 120, 'һǹһ��С����', 20, null, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('13-06-2018', 'dd-mm-yyyy'), 10200, 510, 'yes', 10000, '��', 20, 20);
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-308', 'BO3', '�����װ��', 'M24', '7.62', null, '�����', 800, 900, 901, 902, 950, 966, 400, 17, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('01-10-2018', 'dd-mm-yyyy'), 80, '��ɱ����', 20, null, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('13-06-2018', 'dd-mm-yyyy'), 8200, 410, 'yes', 8000, '��', 20, 20);
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-309', 'BO1', '������װ��', '������', 'I7', null, '�����', 8000, 8100, 8110, 8150, 8200, 8196, 3100, 17, to_date('21-06-2018', 'dd-mm-yyyy'), to_date('01-06-2020', 'dd-mm-yyyy'), 660, 'һ��һ����', 10, null, to_date('21-06-2018', 'dd-mm-yyyy'), to_date('29-06-2018', 'dd-mm-yyyy'), 30000, 3000, 'yes', 280000, '̨', 10, 10);
commit;
prompt 3 records loaded
prompt Loading T_QUOTATION...
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180615001', '001', to_date('15-06-2018', 'dd-mm-yyyy'), to_date('15-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, '10002', null, null, null, null);
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180611001', '001', to_date('12-06-2018', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, null, null, null, null, null);
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180611002', '002', to_date('12-06-2018', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, null, null, null, null, null);
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180611003', '003', to_date('12-06-2018', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, null, null, null, null, null);
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180611004', '004', to_date('12-06-2018', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, null, null, null, null, null);
insert into T_QUOTATION (BILLNO, CUSTOMERID, BILLDATE, VALIDATES, ADDERSSID, CUSTCURRENCYNAME, PRICEOFTAX, EXCHRATE, SALESID, MAKER, DAPARID, PERMITTER, REMARKS)
values ('20180611005', '005', to_date('12-06-2018', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), '1', 'RMB', null, null, null, null, null, null, null);
commit;
prompt 6 records loaded
prompt Loading T_QUOTATION_DETAIL...
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611001', 1, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2̨ʽ��1', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '��ע1');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611002', 2, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2̨ʽ��2', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '��ע2');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611004', 3, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2̨ʽ��3', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '��ע3');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611003', 4, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2̨ʽ��4', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '��ע4');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611005', 5, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2̨ʽ��5', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '��ע5');
commit;
prompt 5 records loaded
prompt Loading T_RECEIVABLE...
prompt Table is empty
prompt Loading T_RECEIVABLE_ADVANCE...
insert into T_RECEIVABLE_ADVANCE (FUNDBILLID, FUNDBILLDATE, CUSTOMERID, RCURRENCYNAME, CASHSTYLEID, CASHSTYLEMONEY, VISASTYLEID, VISASTYLEMONEY, OTHERPAYSTYLEID, OTHERPAYSTYLEMONEY, EXCHRATE, DISCOUNTPER, ACCMONTHTOMONTH, DEPTFROMID, MAKERNAME, PERMITTERNAME)
values ('2018061501', to_date('15-06-2018', 'dd-mm-yyyy'), '001', '�����', 'ת��', 1000, '��Ʊ', 500, null, null, 0, 0, to_date('20-06-2018', 'dd-mm-yyyy'), 2, 'admin', 'admin');
commit;
prompt 1 records loaded
prompt Loading T_RECEIVABLEADVANCE_DETAIL...
insert into T_RECEIVABLEADVANCE_DETAIL (FUNDBILLID, LINEID, SOURCESORTING, SOURCESORTINGBILLNO, CURPRECV, CURMONEY, ABSTRACTS, ADDFIELD1, ADDFIELD2, MEMO)
values ('2018061501', '1', '���۶���', '2018060601', 1000, 1000, 'Ԥ��1000', null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_RECEIVABLE_DETAIL...
prompt Table is empty
prompt Loading T_STOREHOUSE...
prompt Table is empty
prompt Loading T_REQUISITION...
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612001', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '���Ƶ�', '�����', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612002', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '���Ƶ�', '�����', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612003', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '���Ƶ�', '���Ƶ�', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612004', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '���Ƶ�', '���Ƶ�', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612005', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), 'С�Ƶ�', 'С�Ƶ�', null);
commit;
prompt 5 records loaded
prompt Loading T_REQUISITION_DETAIL...
prompt Table is empty
prompt Loading T_RUSHPRICE_HOST...
prompt Table is empty
prompt Loading T_RUSHPRICE_CONTENT...
prompt Table is empty
prompt Loading T_RUSHPRICE_TAKE...
prompt Table is empty
prompt Loading T_SALESRETURN...
prompt Table is empty
prompt Loading T_SALESRETURN_DETAIL...
prompt Table is empty
prompt Loading T_SET_RECEIVABLEL...
prompt Table is empty
prompt Loading T_STOCKOUT_SON...
insert into T_STOCKOUT_SON (BILLID, LINE, PRODID, SUM, BEFOREPRICE, RATEOFDISCOUNT, LASTPRICE, PRICE, TAXATE, TAXATEPRICE, SUMPRICE)
values ('20180615001', 1, 'C01-W-HP-DC7900-307', 2, 4000, 100, 4000, 8000, 17, 170, 8170);
commit;
prompt 1 records loaded
prompt Loading T_STORE_ADJUST_MAIN...
prompt Table is empty
prompt Loading T_STORE_ADJUST_SUB...
prompt Table is empty
prompt Loading T_STORE_IO...
prompt Table is empty
prompt Loading T_TJIA_MAIN...
insert into T_TJIA_MAIN (ID, ADJUSTDATE, BILLNO, INCSUBJECTID, VOUCHARNO, DECSUJECTID, ADJUSTMENT, MAKER, PERMITTER)
values ('1', to_date('11-06-2018', 'dd-mm-yyyy'), '2016-1-1', 'z', 'z', 'z', '������', 'admin', 'a');
insert into T_TJIA_MAIN (ID, ADJUSTDATE, BILLNO, INCSUBJECTID, VOUCHARNO, DECSUJECTID, ADJUSTMENT, MAKER, PERMITTER)
values ('2', to_date('04-06-2018', 'dd-mm-yyyy'), '2016111', 's', 's', 's', '�����', 'admin', 'b');
insert into T_TJIA_MAIN (ID, ADJUSTDATE, BILLNO, INCSUBJECTID, VOUCHARNO, DECSUJECTID, ADJUSTMENT, MAKER, PERMITTER)
values ('3', to_date('01-06-2018', 'dd-mm-yyyy'), '201801231', 'a', 'a', 'a', '������', 'admin', 'c');
commit;
prompt 3 records loaded
prompt Loading T_TJIA_DETAIL...
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('1', '1', 'wc-1', 'Һ����ʾ��', '����', 'pm', 100, 1311, 1600, 11, '��');
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('2', '2', 'wc-2', '�������', '����', 'pm', 99, 2000, 2111, 12, '��');
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('3', '3', 'wc-3', '����', '����', 'ƽpm', 98, 2111, 2333, 20, '��');
commit;
prompt 3 records loaded
prompt Loading T_UNTIL...
insert into T_UNTIL (UNTILID, UNTILNAME, ENGNAME, MEMO)
values (5, 'pcs', null, null);
insert into T_UNTIL (UNTILID, UNTILNAME, ENGNAME, MEMO)
values (2, 'kg', null, null);
insert into T_UNTIL (UNTILID, UNTILNAME, ENGNAME, MEMO)
values (3, 'g', null, null);
commit;
prompt 3 records loaded
prompt Loading T_WARE_ALL...
prompt Table is empty
prompt Loading T_WARE_PRICE...
prompt Table is empty
prompt Loading T_XSHOU_MAIN...
insert into T_XSHOU_MAIN (ID, CUSTOMERID, BILLDATE, BILLNO, ADDRESSID, BILLSTYLEID, CUSTBILLNO, PRICEOFTAX, CURCURRENCYNAME, EXCHRATE, BILLSTATUS, SALESNAME, MAKER, DEPARTNAME, PERMITTER, PROJECTNAME)
values ('1', '����ΰ��', to_date('11-06-2018', 'dd-mm-yyyy'), '201802031', '����', '����', '����', '��˰', '�����', 1, 'δ�᰸', '������', 'admin', '������', 'admin', '����');
insert into T_XSHOU_MAIN (ID, CUSTOMERID, BILLDATE, BILLNO, ADDRESSID, BILLSTYLEID, CUSTBILLNO, PRICEOFTAX, CURCURRENCYNAME, EXCHRATE, BILLSTATUS, SALESNAME, MAKER, DEPARTNAME, PERMITTER, PROJECTNAME)
values ('2', '���޽���', to_date('07-06-2018', 'dd-mm-yyyy'), '20180303', '����', '����', '����', 'δ˰', '�����', 1, '�ѽ᰸', '�ž���', 'admin', '������', 'admin', '����');
insert into T_XSHOU_MAIN (ID, CUSTOMERID, BILLDATE, BILLNO, ADDRESSID, BILLSTYLEID, CUSTBILLNO, PRICEOFTAX, CURCURRENCYNAME, EXCHRATE, BILLSTATUS, SALESNAME, MAKER, DEPARTNAME, PERMITTER, PROJECTNAME)
values ('3', '�Ϻ��̼�', to_date('03-06-2018', 'dd-mm-yyyy'), '2018033001', '����', '����', '����', '��˰', '�����', 1, 'δ�᰸', '�����³�', 'admin', '������', 'admin', '����');
commit;
prompt 3 records loaded
prompt Loading T_XSHOU_DETAIL...
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('1', '4', 'HP DX2710MT- NA296PA#AB2һ���s', 'C01-W-HP-DX2710-299', '����', 'pm', 12, 1512, 158, 15132, 132123, 17, 1213, 123132, to_date('15-06-2018', 'dd-mm-yyyy'), 10, '��', '��֪��', '��', '��Դ����', '��Դ����', '��', '��', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('1', '1', 'HP DX2710MT- NA296PA#AB2̨ʽ��', 'C01-W-HP-DX2710-296', '����', 'pm', 10, 1611, 60, 1200, 12000, 17, 1052, 13001, to_date('11-06-2018', 'dd-mm-yyyy'), 10, '��', '��֪��', '��', '��Դ����', '��Դ����', '��', '��', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('2', '2', 'HP DX2710MT- NA296PA#AB2�ʼǱ�', 'C01-W-HP-DX2710-297', '����', 'pm', 11, 1412, 12, 200, 2200, 17, 1200, 12021, to_date('01-06-2018', 'dd-mm-yyyy'), 10, '��', '��֪��', '��', '��Դ����', '��Դ����', '��', '��', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('3', '3', 'HP DX2710MT- NA296PA#AB2һ���', 'C01-W-HP-DX2710-298', '����', 'pm', 12, 1520, 100, 1520, 1211, 17, 1511, 15811, to_date('05-06-2018', 'dd-mm-yyyy'), 10, '��', '��֪��', '��', '��Դ����', '��Դ����', '��', '��', 0);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for PURCHASING_TOWARE_DETAILS...
alter table PURCHASING_TOWARE_DETAILS enable constraint FK_PERMITTER;
prompt Enabling foreign key constraints for STAFF_MASTER_FILE...
alter table STAFF_MASTER_FILE enable constraint FK_DEPARTMENTID;
prompt Enabling foreign key constraints for T_CUSTOMER...
alter table T_CUSTOMER enable constraint FK_CU_1;
prompt Enabling foreign key constraints for T_STOCKOUT_MAIN...
alter table T_STOCKOUT_MAIN enable constraint �ͻ����;
alter table T_STOCKOUT_MAIN enable constraint �����;
alter table T_STOCKOUT_MAIN enable constraint ҵ����Ա;
alter table T_STOCKOUT_MAIN enable constraint ���òֿ�;
alter table T_STOCKOUT_MAIN enable constraint �Ƶ���;
prompt Enabling foreign key constraints for T_ACCOUNT_SON...
alter table T_ACCOUNT_SON enable constraint ���ⵥ�����;
alter table T_ACCOUNT_SON enable constraint �ͻ�ID;
prompt Enabling foreign key constraints for T_ACCOUNT_WATER...
alter table T_ACCOUNT_WATER enable constraint �������;
prompt Enabling foreign key constraints for T_ADVANCE_HOST...
alter table T_ADVANCE_HOST enable constraint FK_CASHID_ONE;
alter table T_ADVANCE_HOST enable constraint FK_CASHID_THREE;
alter table T_ADVANCE_HOST enable constraint FK_CASHID_TWO;
prompt Enabling foreign key constraints for T_ADVANCE_DETAILS...
alter table T_ADVANCE_DETAILS enable constraint FK_DETAILS_DETAILSID;
prompt Enabling foreign key constraints for T_CUSTOM_ADDRESS_DETAIL...
alter table T_CUSTOM_ADDRESS_DETAIL enable constraint FK_CU_DE_1;
prompt Enabling foreign key constraints for T_PROD_MAIN...
alter table T_PROD_MAIN enable constraint �������;
prompt Enabling foreign key constraints for T_QUOTATION...
alter table T_QUOTATION enable constraint FK_QU_1;
alter table T_QUOTATION enable constraint FK_QU_2;
alter table T_QUOTATION enable constraint FK_QU_3;
alter table T_QUOTATION enable constraint FK_QU_4;
prompt Enabling foreign key constraints for T_QUOTATION_DETAIL...
alter table T_QUOTATION_DETAIL enable constraint FK_QU_DE_1;
alter table T_QUOTATION_DETAIL enable constraint FK_QU_DE_2;
prompt Enabling foreign key constraints for T_RECEIVABLE_ADVANCE...
alter table T_RECEIVABLE_ADVANCE enable constraint RECEADVANCE_FK_CUSTOMER;
alter table T_RECEIVABLE_ADVANCE enable constraint RECEADVANCE_FK_DEPART;
prompt Enabling foreign key constraints for T_RECEIVABLEADVANCE_DETAIL...
alter table T_RECEIVABLEADVANCE_DETAIL enable constraint SYS_C009828;
prompt Enabling foreign key constraints for T_RECEIVABLE_DETAIL...
alter table T_RECEIVABLE_DETAIL enable constraint SYS_C009846;
prompt Enabling foreign key constraints for T_REQUISITION...
alter table T_REQUISITION enable constraint FK_RE_1;
alter table T_REQUISITION enable constraint FK_RE_2;
prompt Enabling foreign key constraints for T_REQUISITION_DETAIL...
alter table T_REQUISITION_DETAIL enable constraint FK_RE_DE_1;
prompt Enabling foreign key constraints for T_RUSHPRICE_HOST...
alter table T_RUSHPRICE_HOST enable constraint FK_RUSHPRIC_ONE;
alter table T_RUSHPRICE_HOST enable constraint FK_RUSHPRIC_THREE;
alter table T_RUSHPRICE_HOST enable constraint FK_RUSHPRIC_TWO;
prompt Enabling foreign key constraints for T_RUSHPRICE_CONTENT...
alter table T_RUSHPRICE_CONTENT enable constraint FK_CONTENT_RUSHPRICECONTENTIDS;
prompt Enabling foreign key constraints for T_RUSHPRICE_TAKE...
alter table T_RUSHPRICE_TAKE enable constraint FK_TAKE_RUSHPRICETAKEID;
prompt Enabling foreign key constraints for T_SALESRETURN_DETAIL...
alter table T_SALESRETURN_DETAIL enable constraint SALESRETURN_OF_DETAIL;
prompt Enabling foreign key constraints for T_STOCKOUT_SON...
alter table T_STOCKOUT_SON enable constraint ���ó��ⵥ��;
alter table T_STOCKOUT_SON enable constraint ��������;
prompt Enabling foreign key constraints for T_TJIA_DETAIL...
alter table T_TJIA_DETAIL enable constraint WAI1;
prompt Enabling foreign key constraints for T_WARE_ALL...
alter table T_WARE_ALL enable constraint �����ֿ�;
alter table T_WARE_ALL enable constraint ��������;
prompt Enabling foreign key constraints for T_WARE_PRICE...
alter table T_WARE_PRICE enable constraint �ֿ����;
alter table T_WARE_PRICE enable constraint �������;
prompt Enabling foreign key constraints for T_XSHOU_DETAIL...
alter table T_XSHOU_DETAIL enable constraint WAI;
set feedback on
set define on
prompt Done.
