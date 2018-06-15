prompt PL/SQL Developer import file
prompt Created on 2018年6月16日 by Administrator
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
  is '部门设定表';
comment on column DEPART.DEPARTID
  is '部门编号';
comment on column DEPART.DEPARTNAME
  is '部门名称';
comment on column DEPART.ENGNAME
  is '英文名称';
comment on column DEPART.MEMO
  is '备注';
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
  is '单据类型设定表';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPE
  is '来源单别';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPEID
  is '类型编号';
comment on column DOCUMENT_OFTYPE.DOCUMENT_TYPENAME
  is '类型名称';
comment on column DOCUMENT_OFTYPE.MEMO
  is '备注';
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
  is '自增编号';
comment on column D_TYPE.TYPENAME
  is '单据类型名称';
comment on column D_TYPE.ENAME
  is '英文名称';
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
  is '''单据编号''';
comment on column PURCHASE_RETURN.TIME
  is '''单据日期''';
comment on column PURCHASE_RETURN.DTYPEID
  is '''单据类型ID';
comment on column PURCHASE_RETURN.SUPPLIERSID
  is '''供应商编号';
comment on column PURCHASE_RETURN.SAID
  is '''供应商地址编号''';
comment on column PURCHASE_RETURN.ADDRESS
  is '''供应商地址''';
comment on column PURCHASE_RETURN.TAXNO
  is '''单价是否含税(0否，1是)''';
comment on column PURCHASE_RETURN.STOREHOUSE
  is '''仓库''';
comment on column PURCHASE_RETURN.NO_AGAIN
  is '''是否重新入库(0否，1是)''';
comment on column PURCHASE_RETURN.CURRENCY
  is '''币种''';
comment on column PURCHASE_RETURN.CURRENCYRATE
  is '''汇率''';
comment on column PURCHASE_RETURN.EXCHANGE_RATE
  is '''国外贸易(0否，1是)''';
comment on column PURCHASE_RETURN.PURCHASE_HUMAN
  is '''采购人员''';
comment on column PURCHASE_RETURN.TOUCHING_HUMAN
  is '''制单人员''';
comment on column PURCHASE_RETURN.DEPARTMENT
  is '''所属部门''';
comment on column PURCHASE_RETURN.CHECK_HUMAN
  is '''复核人员''';
comment on column PURCHASE_RETURN.PROJECT
  is '''所属项目''';
comment on column PURCHASE_RETURN.NO_EXAMINE
  is '''是否审核(0未审核，1已审核)''';
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
  is '''单据类型ID';
comment on column PURCHASE_RETURN_DETAIL.ODD_NUMBERS
  is '''单据编号''';
comment on column PURCHASE_RETURN_DETAIL.ID
  is '''行号''';
comment on column PURCHASE_RETURN_DETAIL.MATTERID
  is '''物料编号''';
comment on column PURCHASE_RETURN_DETAIL.MATTERNAME
  is '''物料名称''';
comment on column PURCHASE_RETURN_DETAIL.SPECIFICATIONS_MODEL
  is '''规格型号''';
comment on column PURCHASE_RETURN_DETAIL.UNIT
  is '''单位''';
comment on column PURCHASE_RETURN_DETAIL.QUANTITY
  is '''数量''';
comment on column PURCHASE_RETURN_DETAIL.FRONT_UNIT_PRICE
  is '''折扣前单价''';
comment on column PURCHASE_RETURN_DETAIL.BROKEN_NUMBER
  is '''折数''';
comment on column PURCHASE_RETURN_DETAIL.UNIT_PRICE
  is '''单价''';
comment on column PURCHASE_RETURN_DETAIL.AMOUNT
  is '''金额''';
comment on column PURCHASE_RETURN_DETAIL.TAX_RATE
  is '''税率''';
comment on column PURCHASE_RETURN_DETAIL.TAX_LIMIT
  is '''税额''';
comment on column PURCHASE_RETURN_DETAIL.GIFT
  is '''是否赠品（0否，1是）''';
comment on column PURCHASE_RETURN_DETAIL.ADD_TAX_AMOUNT
  is '''含税金额''';
comment on column PURCHASE_RETURN_DETAIL.SOURCE_TYPE
  is '''来源单别''';
comment on column PURCHASE_RETURN_DETAIL.SOURCE_ODD_NUMBERS
  is '''来源单号''';
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
  is '采购入库单主表';
comment on column PURCHASING_TOWARE.BILLNO
  is '单据号码';
comment on column PURCHASING_TOWARE.BILLDATE
  is '单据日期';
comment on column PURCHASING_TOWARE.GUSTID
  is '供应商';
comment on column PURCHASING_TOWARE.ADDRID
  is '供应商地址';
comment on column PURCHASING_TOWARE.SALECLASSID
  is '采购入库类型';
comment on column PURCHASING_TOWARE.CURRID
  is '币别';
comment on column PURCHASING_TOWARE.PRICEOFTAX
  is '单价是否含税';
comment on column PURCHASING_TOWARE.EXCHRATE
  is '汇率';
comment on column PURCHASING_TOWARE.WAREID
  is '仓库';
comment on column PURCHASING_TOWARE.SALEID
  is '采购人员';
comment on column PURCHASING_TOWARE.DEPARTID
  is '部门名称';
comment on column PURCHASING_TOWARE.MAKER
  is '制单人员';
comment on column PURCHASING_TOWARE.PERMITTER
  is '复核人员';
comment on column PURCHASING_TOWARE.PROJECTID
  is '所属项目';
comment on column PURCHASING_TOWARE.MEMO
  is '备注';
comment on column PURCHASING_TOWARE.ISPERMITTER
  is '审核状态0未审核，1已审核';
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
  is '采购入库单内容表';
comment on column PURCHASING_TOWARE_DETAILS.SERNO
  is '栏号';
comment on column PURCHASING_TOWARE_DETAILS.BILLID
  is '采购入库单编号';
comment on column PURCHASING_TOWARE_DETAILS.PRODID
  is '物料编号';
comment on column PURCHASING_TOWARE_DETAILS.PRODSIZE
  is '物料名称';
comment on column PURCHASING_TOWARE_DETAILS.STDUNITID
  is '规格型号';
comment on column PURCHASING_TOWARE_DETAILS.SQUANTITY
  is '单位名称';
comment on column PURCHASING_TOWARE_DETAILS.OLDPRICE
  is '数量';
comment on column PURCHASING_TOWARE_DETAILS.DISCOUNT
  is '折扣前单价';
comment on column PURCHASING_TOWARE_DETAILS.SPRICE
  is '折数';
comment on column PURCHASING_TOWARE_DETAILS.AMOUNT
  is '单价';
comment on column PURCHASING_TOWARE_DETAILS.TAXRATE
  is '金额';
comment on column PURCHASING_TOWARE_DETAILS.TAXAMT
  is '税额';
comment on column PURCHASING_TOWARE_DETAILS.AMOUNTATAX
  is '含税金额';
comment on column PURCHASING_TOWARE_DETAILS.BATCHID
  is '批号';
comment on column PURCHASING_TOWARE_DETAILS.ISGIFT
  is '赠品';
comment on column PURCHASING_TOWARE_DETAILS.FROMTYPE
  is '来源单别';
comment on column PURCHASING_TOWARE_DETAILS.FROMNO
  is '来源单号';
comment on column PURCHASING_TOWARE_DETAILS.MLAOUNT
  is '分摊费用';
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
  is '人员主文件设定表';
comment on column STAFF_MASTER_FILE.STAFFID
  is '人员编号';
comment on column STAFF_MASTER_FILE.DEPARTMENTID
  is '所属部门';
comment on column STAFF_MASTER_FILE.STAFFNAME
  is '人员姓名';
comment on column STAFF_MASTER_FILE.SEX
  is '性别';
comment on column STAFF_MASTER_FILE.STAFFEN_NAME
  is '英文名称';
comment on column STAFF_MASTER_FILE.IDCARD
  is '身份证号';
comment on column STAFF_MASTER_FILE.BIRTHDAY
  is '出生日期';
comment on column STAFF_MASTER_FILE.POLITICS_STATUS
  is '政治面貌';
comment on column STAFF_MASTER_FILE.MARRIAGE_STATUS
  is '婚姻状态';
comment on column STAFF_MASTER_FILE.INDUCTION_DATE
  is '入职日期';
comment on column STAFF_MASTER_FILE.BLOOD_GROUP
  is '血型';
comment on column STAFF_MASTER_FILE.REGULAR_WORKER_DATE
  is '转正日期';
comment on column STAFF_MASTER_FILE.NATIVE_PLACE
  is '籍贯';
comment on column STAFF_MASTER_FILE.QUALIFYING_PERIOD
  is '试用期长';
comment on column STAFF_MASTER_FILE.NATIONALITY
  is '国籍';
comment on column STAFF_MASTER_FILE.LEAVE_OFFICE_DATE
  is '离职日期';
comment on column STAFF_MASTER_FILE.NATION
  is '民族';
comment on column STAFF_MASTER_FILE.TECHNICAL_TITLE
  is '技术职称';
comment on column STAFF_MASTER_FILE.CN_DUTIES
  is '中文职务';
comment on column STAFF_MASTER_FILE.EN_DUTIES
  is '英文职务';
comment on column STAFF_MASTER_FILE.LINKPOSTCODE
  is '联系邮编';
comment on column STAFF_MASTER_FILE.LINKADDRESS
  is '联系地址';
comment on column STAFF_MASTER_FILE.LINKPHONE
  is '联系电话';
comment on column STAFF_MASTER_FILE.PHONE
  is '移动电话';
comment on column STAFF_MASTER_FILE.HIGHEST_EDUCATION
  is '最高学历';
comment on column STAFF_MASTER_FILE.EXPIRATION_DATE
  is '到期日期';
comment on column STAFF_MASTER_FILE.GRADUATE
  is '毕业学校';
comment on column STAFF_MASTER_FILE.PASSPORT_NUMBER
  is '护照号码';
comment on column STAFF_MASTER_FILE.COLLEGE_MAJOR
  is '所学专业';
comment on column STAFF_MASTER_FILE.PACT_START_DATE
  is '合同起始日期';
comment on column STAFF_MASTER_FILE.EXPERIENCES_DATE
  is '体验日期';
comment on column STAFF_MASTER_FILE.EMAIL
  is '电子邮件';
comment on column STAFF_MASTER_FILE.CONTRACT_PERIOD
  is '合同期（长）';
comment on column STAFF_MASTER_FILE.NOW_PHONE
  is '现电话';
comment on column STAFF_MASTER_FILE.DOMICILE_PHONE
  is '户籍电话';
comment on column STAFF_MASTER_FILE.NOW_POSTCODE
  is '现邮编';
comment on column STAFF_MASTER_FILE.NOW_ADDRESS
  is '现地址';
comment on column STAFF_MASTER_FILE.EMERGENCY_LINKMAN
  is '紧急联系人';
comment on column STAFF_MASTER_FILE.HOME_PHONE
  is '家庭电话';
comment on column STAFF_MASTER_FILE.EMERGENCY_POSTCODE
  is '紧急联系邮编';
comment on column STAFF_MASTER_FILE.EMERGENCY_LINKPHONE
  is '紧急联系电话';
comment on column STAFF_MASTER_FILE.HOME_ADDRESS
  is '  家庭地址';
comment on column STAFF_MASTER_FILE.EMERGENCY_ADDRESS
  is '紧急联系地址';
comment on column STAFF_MASTER_FILE.REMARK
  is '备注';
comment on column STAFF_MASTER_FILE.STANDBY_1
  is '备用列1';
comment on column STAFF_MASTER_FILE.STANDBY_2
  is '备用列2';
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
  is '供应商编号';
comment on column SUPPLIERS.STID
  is '类别编号';
comment on column SUPPLIERS.FUNDSATTRIBNAME
  is '账款归属';
comment on column SUPPLIERS.FULLNAME
  is '供应商全称';
comment on column SUPPLIERS.SHORTNAME
  is '供应商简称';
comment on column SUPPLIERS.PERSONNID
  is '采购人员';
comment on column SUPPLIERS.ENGFULLNAME
  is '英文全称';
comment on column SUPPLIERS.ENGSHORTNAME
  is '英文简称';
comment on column SUPPLIERS.CURRENCYID
  is '币种';
comment on column SUPPLIERS.CURRENCYRATE
  is '汇率';
comment on column SUPPLIERS.TAXNO
  is '单价是否含税';
comment on column SUPPLIERS.CREDITRATING
  is '信用等级';
comment on column SUPPLIERS.AMOUNTQUOTA
  is '账款额度';
comment on column SUPPLIERS.REMAINQUOTA
  is '剩余额度';
comment on column SUPPLIERS.STARTADVRECV
  is '期初预付款';
comment on column SUPPLIERS.STARTRECEIVABLE
  is '期初应付款';
comment on column SUPPLIERS.CURADVRECV
  is '期末预付款';
comment on column SUPPLIERS.CURRECEIVABLE
  is '期末应付款';
comment on column SUPPLIERS.AREA
  is '地区';
comment on column SUPPLIERS.PRINCIPAL
  is '负责人';
comment on column SUPPLIERS.TELEPHONE
  is '联系人';
comment on column SUPPLIERS.TELEPHONE1
  is '联系电话1';
comment on column SUPPLIERS.TELEPHONE2
  is '联系电话2';
comment on column SUPPLIERS.TELEPHONE3
  is '联系电话3';
comment on column SUPPLIERS.MOBILE_TELEPHONE
  is '移动电话';
comment on column SUPPLIERS.BANK_ACCOUNT
  is '银行账号';
comment on column SUPPLIERS.BANK_OF_DEPOSIT
  is '开户银行';
comment on column SUPPLIERS.PORTRAITURE
  is '传真号码';
comment on column SUPPLIERS.URL
  is '网址';
comment on column SUPPLIERS.MAIL_BOX
  is '电子邮箱';
comment on column SUPPLIERS.TRADE
  is '行业别';
comment on column SUPPLIERS.AMOUNT_OF_CAPITAL
  is '资本额';
comment on column SUPPLIERS.TAX_REGISTRATION
  is '税务登记号';
comment on column SUPPLIERS.PRIME1
  is '最初采购入库日';
comment on column SUPPLIERS.PRIME2
  is '最初采购退货日';
comment on column SUPPLIERS.RECENTLY1
  is '最近采购入库日';
comment on column SUPPLIERS.RECENTLY2
  is '最近采购退货日';
comment on column SUPPLIERS.MARKET_DAY
  is '终止交易日';
comment on column SUPPLIERS.TERM_OF_PAYMENT
  is '付款条件';
comment on column SUPPLIERS.PAYMENT
  is '付款天数';
comment on column SUPPLIERS.FARE_TICKET_TYPE
  is '发票类型';
comment on column SUPPLIERS.MONTHLY
  is '每月结账日';
comment on column SUPPLIERS.NO_MONEY
  is '未开票金额';
comment on column SUPPLIERS.SUBJECT1
  is '预付账款科目';
comment on column SUPPLIERS.SUBJECT2
  is '应付账款科目';
comment on column SUPPLIERS.SUBJECT3
  is '应付暂估科目';
comment on column SUPPLIERS.REMARKS
  is '备注';
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
  is '''单据类型ID';
comment on column SUPPLIERS_ACCOUNT_DETAIL.ODD_NUMBERS
  is '''单号''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.ID
  is '''行号''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.SUPPLIERDID
  is '供应商编号';
comment on column SUPPLIERS_ACCOUNT_DETAIL.TIME
  is '''日期''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.PRIMARY_METALS
  is '''原单金额''';
comment on column SUPPLIERS_ACCOUNT_DETAIL.PRESENT_METALS
  is '''现行余额''';
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
  is '''地址编号''';
comment on column SUPPLIERS_ADDRESS.SID
  is '''供应商编号''';
comment on column SUPPLIERS_ADDRESS.ADDRESS
  is '''地址''';
comment on column SUPPLIERS_ADDRESS.REMARKS
  is '''备注''';
comment on column SUPPLIERS_ADDRESS.ZIP_CODE
  is '邮政编码';
comment on column SUPPLIERS_ADDRESS.CONTACTS
  is '联系人';
comment on column SUPPLIERS_ADDRESS.CONTACTS_TITLES
  is '联系人职称';
comment on column SUPPLIERS_ADDRESS.TELEPHONE
  is '联系电话';
comment on column SUPPLIERS_ADDRESS.PORTRAITURE
  is '传真号码';
comment on column SUPPLIERS_ADDRESS.ROUTE
  is '行走路线';
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
  is '''类别编号''';
comment on column SUPPLIERS_TYPE.MEMO
  is '''备注''';
comment on column SUPPLIERS_TYPE.ENGNAME
  is '''英文名称''';
comment on column SUPPLIERS_TYPE.CLASSNAME
  is '''类别名称''';
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
  is '自增编号';
comment on column S_WATER_METER.TIME
  is '日期';
comment on column S_WATER_METER.RMB_SHU
  is '应付款金额';
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
  is '客户类别';
comment on column T_CUSTOM_CLASS.CLASSID
  is '客户类别编号';
comment on column T_CUSTOM_CLASS.CLASSNAME
  is '客户类别名称';
comment on column T_CUSTOM_CLASS.ENGNAME
  is '英文名称';
comment on column T_CUSTOM_CLASS.REMARK
  is '备注';
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
  is '客户编号';
comment on column T_CUSTOMER.FUNDSATTRIBUTION
  is '账款归属';
comment on column T_CUSTOMER.FULLNAME
  is '客户全称';
comment on column T_CUSTOMER.CLASSID
  is '类别编号';
comment on column T_CUSTOMER.CUSTOMERABBREVIATION
  is '客户简称';
comment on column T_CUSTOMER.AREANAME
  is '地区';
comment on column T_CUSTOMER.ENGFULLNAME
  is '英文全称';
comment on column T_CUSTOMER.CURRENCYNAME
  is '币别名称';
comment on column T_CUSTOMER.CHIEFID
  is '负责人编号';
comment on column T_CUSTOMER.PERSONID
  is '业务人员编号';
comment on column T_CUSTOMER.LINKMANID
  is '联系人编号';
comment on column T_CUSTOMER.TELEPHONE
  is '联系电话';
comment on column T_CUSTOMER.CAPITALIZATION
  is '资本额';
comment on column T_CUSTOMER.ENGSHORNAME
  is '英文简称';
comment on column T_CUSTOMER.EMAIL
  is '电子邮箱';
comment on column T_CUSTOMER.MOBILETEL
  is '移动电话';
comment on column T_CUSTOMER.WEBADDRESS
  is '网址';
comment on column T_CUSTOMER.BANKACCOUNT
  is '银行账号';
comment on column T_CUSTOMER.FAXNO
  is '传真号码';
comment on column T_CUSTOMER.BANKNAME
  is '开户银行';
comment on column T_CUSTOMER.RATEOFDISCOUNT
  is '折数';
comment on column T_CUSTOMER.PRICERANK
  is '售价等级';
comment on column T_CUSTOMER.PRICEOFTAX
  is '单价是否含税';
comment on column T_CUSTOMER.BUILDUPDATE
  is '客户建立日期';
comment on column T_CUSTOMER.LASTVISITDATE
  is '最近拜访日';
comment on column T_CUSTOMER.BOOKVISITDATE
  is '预约拜访日';
comment on column T_CUSTOMER.INVALIDDATE
  is '终止交易日';
comment on column T_CUSTOMER.AMOUNTQUOTA
  is '账款额度';
comment on column T_CUSTOMER.REMAINQUATA
  is '剩余额度';
comment on column T_CUSTOMER.RECRWAY
  is '收款条件';
comment on column T_CUSTOMER.RECEIVABLES
  is '收款天数';
comment on column T_CUSTOMER.DAYOFCLOSE
  is '每月结账日';
comment on column T_CUSTOMER.CREDITLEVEL
  is '信用等级';
comment on column T_CUSTOMER.INVOTYPENAME
  is '发票类型';
comment on column T_CUSTOMER.ACCRECEIVABLE
  is '应收账款科目';
comment on column T_CUSTOMER.STARTADVRECV
  is '期初预收款';
comment on column T_CUSTOMER.STARTRECEIVABLE
  is '期初应收款';
comment on column T_CUSTOMER.CURADVRECV
  is '期末预收款';
comment on column T_CUSTOMER.CURRECEIVABLE
  is '期末应收款';
comment on column T_CUSTOMER.NOTINVQUOTA
  is '未开票金额';
comment on column T_CUSTOMER.ACCADVRECV
  is '预收账款科目';
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
  is '仓库编号';
comment on column T_WARE_MAIN.WAREHOUSENAME
  is '仓库名称';
comment on column T_WARE_MAIN.ENGNAME
  is '英文名称';
comment on column T_WARE_MAIN.SHORTNAME
  is '简称';
comment on column T_WARE_MAIN.LINKNAME
  is '联系人员';
comment on column T_WARE_MAIN.TELEPHONE
  is '联系电话';
comment on column T_WARE_MAIN.WAREHOUSEADDRESS
  is '地址';
comment on column T_WARE_MAIN.MEMO
  is '备注';
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
  is '销售出库单ID';
comment on column T_STOCKOUT_MAIN.BILLDATE
  is '订单日期';
comment on column T_STOCKOUT_MAIN.BILLSTATUS
  is '订单状态';
comment on column T_STOCKOUT_MAIN.AUDITORID
  is '审核人ID';
comment on column T_STOCKOUT_MAIN.DOCUMENTMAKERID
  is '制单人ID';
comment on column T_STOCKOUT_MAIN.BUSINESSID
  is '业务人员ID';
comment on column T_STOCKOUT_MAIN.SUMAMTATAX
  is '含税金额';
comment on column T_STOCKOUT_MAIN.SUMNUM
  is '数量总和';
comment on column T_STOCKOUT_MAIN.SUMPRICE
  is '金额（不含税）';
comment on column T_STOCKOUT_MAIN.CURRNAME
  is '币别';
comment on column T_STOCKOUT_MAIN.GATHERMONTH
  is '收款月份';
comment on column T_STOCKOUT_MAIN.GATHERSTYLE
  is '收款条件';
comment on column T_STOCKOUT_MAIN.GATHERDELAY
  is '收款天数';
comment on column T_STOCKOUT_MAIN.SALECLASSID
  is '销售出库类型ID';
comment on column T_STOCKOUT_MAIN.DELIVERYADDRESS
  is '地址';
comment on column T_STOCKOUT_MAIN.WAREID
  is '仓库ID';
comment on column T_STOCKOUT_MAIN.CUSTID
  is '客户ID';
comment on column T_STOCKOUT_MAIN.TELEPHONE1
  is '联系电话一';
comment on column T_STOCKOUT_MAIN.TELEPHONE2
  is '联系电话二';
comment on column T_STOCKOUT_MAIN.MEMO
  is '备注';
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
  add constraint 客户编号 foreign key (CUSTID)
  references T_CUSTOMER (CUSTID);
alter table T_STOCKOUT_MAIN
  add constraint 审核人 foreign key (AUDITORID)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_STOCKOUT_MAIN
  add constraint 业务人员 foreign key (BUSINESSID)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_STOCKOUT_MAIN
  add constraint 引用仓库 foreign key (WAREID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_STOCKOUT_MAIN
  add constraint 制单人 foreign key (DOCUMENTMAKERID)
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
  is '订单编号';
comment on column T_ACCOUNT_SON.BILLTYPEID
  is '来源单别';
comment on column T_ACCOUNT_SON.CUSTID
  is '客户ID';
comment on column T_ACCOUNT_SON.BILLDATE
  is '单据日期';
comment on column T_ACCOUNT_SON.BEFOREPRICE
  is '原单金额';
comment on column T_ACCOUNT_SON.NOWPRICE
  is '现行余额';
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
  add constraint 出库单号外键 foreign key (BILLID)
  references T_STOCKOUT_MAIN (BILLID);
alter table T_ACCOUNT_SON
  add constraint 客户ID foreign key (CUSTID)
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
  is '客户账款流水表';
comment on column T_ACCOUNT_WATER.BILLNOID
  is '出库单号';
comment on column T_ACCOUNT_WATER.MONEY
  is '记录金额';
alter table T_ACCOUNT_WATER
  add constraint 单号外键 foreign key (BILLNOID)
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
  is '付款类型表';
comment on column T_RUSHPRICE_CASH.CASHID
  is '付款类型表ID';
comment on column T_RUSHPRICE_CASH.CASHTYPE
  is '付款类型名称';
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
  is '预付款主表';
comment on column T_ADVANCE_HOST.ACCADVRECVID
  is '预付款单编号';
comment on column T_ADVANCE_HOST.CUSTOMERID
  is '供应商编号';
comment on column T_ADVANCE_HOST.FUNDBILLDATE
  is '单据日期';
comment on column T_ADVANCE_HOST.FUNDBILLID
  is '单据号码';
comment on column T_ADVANCE_HOST.CURR
  is '币别';
comment on column T_ADVANCE_HOST.CASHID_ONE
  is '预付结算方式一';
comment on column T_ADVANCE_HOST.CASHID_TWO
  is '预付结算方式二';
comment on column T_ADVANCE_HOST.CASHID_THREE
  is '预付结算方式三';
comment on column T_ADVANCE_HOST.CASH_ONE_PRICE
  is '预付结算方式一金额';
comment on column T_ADVANCE_HOST.CASH_TWO_PRICE
  is '预付结算方式二金额';
comment on column T_ADVANCE_HOST.CASH_THREE_PRICE
  is '预付结算方式三金额';
comment on column T_ADVANCE_HOST.CASHSUMPRICE
  is '预付结算总金额';
comment on column T_ADVANCE_HOST.EXCHRATE
  is '汇率';
comment on column T_ADVANCE_HOST.DISCOUNTPER
  is '折扣率';
comment on column T_ADVANCE_HOST.ACCMONTHTOMONTH
  is '凭证编号';
comment on column T_ADVANCE_HOST.DEPARTID
  is '所属部门ID';
comment on column T_ADVANCE_HOST.MAKERSIGN
  is '制单人员';
comment on column T_ADVANCE_HOST.PERMITTERSIGN
  is '复核人员';
comment on column T_ADVANCE_HOST.STATUS
  is '单据状态';
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
  is '预付款详表';
comment on column T_ADVANCE_DETAILS.LINENO
  is '行号';
comment on column T_ADVANCE_DETAILS.DETAILSID
  is '预付款单编号';
comment on column T_ADVANCE_DETAILS.ACCADVRECVPRICE
  is '预付金额';
comment on column T_ADVANCE_DETAILS.BILLTYPE
  is '来源单别';
comment on column T_ADVANCE_DETAILS.ORDERNO
  is '来源单号';
comment on column T_ADVANCE_DETAILS.CURPRERECV
  is '预付余额';
comment on column T_ADVANCE_DETAILS.DESCRIPTION
  is '摘要';
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
  is '单据编号';
comment on column T_BUY.BILLNODATE
  is '单据日期';
comment on column T_BUY.CUSTOMERID
  is '供应商编号';
comment on column T_BUY.FACTCURRYENCYNAME
  is '币别';
comment on column T_BUY.BILLSTYLEID
  is '采购订单类型';
comment on column T_BUY.PRICETAX
  is '单价是否含税（1,含税,0，未税）';
comment on column T_BUY.EXCHRATE
  is '汇率';
comment on column T_BUY.MAKER
  is '制单人员(引用人员表)';
comment on column T_BUY.PERMIT
  is '复核人员（引用人员表）';
comment on column T_BUY.SALESID
  is '采购人员（引用人员表）';
comment on column T_BUY.DEPARTID
  is '所属部门编号';
comment on column T_BUY.CHECKSTATE
  is '审核状态（1，未审核，0：已审核）';
comment on column T_BUY.PROJECTID
  is '所属项目';
comment on column T_BUY.BTYPE
  is '单据类型编号';
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
  is '单据编号';
comment on column T_BUY_DETAILS.LINE
  is '行号';
comment on column T_BUY_DETAILS.PRODID
  is '物料编号';
comment on column T_BUY_DETAILS.SQUANTITY
  is '数量';
comment on column T_BUY_DETAILS.OLDPRICE
  is '折扣前单价';
comment on column T_BUY_DETAILS.DISCOUNT
  is '折数';
comment on column T_BUY_DETAILS.SPRICE
  is '单价';
comment on column T_BUY_DETAILS.AMOUNT
  is '金额';
comment on column T_BUY_DETAILS.TAXRATE
  is '税率';
comment on column T_BUY_DETAILS.TAXAMT
  is '税额';
comment on column T_BUY_DETAILS.VFTOLAT
  is '含税金额';
comment on column T_BUY_DETAILS.ISGIFT
  is '是否有赠品(1.无赠品，0.有赠品)';
comment on column T_BUY_DETAILS.PREINDATE
  is '预入库日';
comment on column T_BUY_DETAILS.QTYREMAIN
  is '未入库数量';
comment on column T_BUY_DETAILS.TRAANTYPE
  is '来源单别';
comment on column T_BUY_DETAILS.FROMNO
  is '来源单号';
comment on column T_BUY_DETAILS.ITEMREMARK
  is '分录备注';
comment on column T_BUY_DETAILS.BTYPE
  is '单据类型编号';
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
  is '单据编号';
comment on column T_BUY_INQUIRY.BILLNODATE
  is '单据日期';
comment on column T_BUY_INQUIRY.CUSTOMERID
  is '供应商编号';
comment on column T_BUY_INQUIRY.FACTCURRYENCYNAME
  is '币别';
comment on column T_BUY_INQUIRY.VALIDDATE
  is '有效日期';
comment on column T_BUY_INQUIRY.PRICETAX
  is '单价是否含税（1,含税,0，未税）';
comment on column T_BUY_INQUIRY.EXCHRATE
  is '汇率';
comment on column T_BUY_INQUIRY.MAKER
  is '制单人员';
comment on column T_BUY_INQUIRY.PERMIT
  is '复核人员';
comment on column T_BUY_INQUIRY.SALESID
  is '采购人员';
comment on column T_BUY_INQUIRY.DEPARTID
  is '所属部门编号';
comment on column T_BUY_INQUIRY.CHECKSTATE
  is '审核状态（1，未审核，0：已审核）';
comment on column T_BUY_INQUIRY.OUTADDRESS
  is '送货地址';
comment on column T_BUY_INQUIRY.BTYPE
  is '单据类型编号';
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
  is '单据编号';
comment on column T_BUY_INQUIRY_DETAILS.LINE
  is '行号';
comment on column T_BUY_INQUIRY_DETAILS.PRODID
  is '物料编号';
comment on column T_BUY_INQUIRY_DETAILS.CLASSNAME
  is '物料名称';
comment on column T_BUY_INQUIRY_DETAILS.PRODSIZE
  is '规格型号';
comment on column T_BUY_INQUIRY_DETAILS.STUUNTILNAME
  is '单位名称';
comment on column T_BUY_INQUIRY_DETAILS.SQUANTITY
  is '数量';
comment on column T_BUY_INQUIRY_DETAILS.AMOUNT
  is '金额';
comment on column T_BUY_INQUIRY_DETAILS.TAXRATE
  is '税率';
comment on column T_BUY_INQUIRY_DETAILS.TAXAMT
  is '税额';
comment on column T_BUY_INQUIRY_DETAILS.VFTOLAT
  is '含税金额';
comment on column T_BUY_INQUIRY_DETAILS.ISGIFT
  is '是否有赠品（1.有赠品，0.无赠品）';
comment on column T_BUY_INQUIRY_DETAILS.ITEMREMARK
  is '分录备注';
comment on column T_BUY_INQUIRY_DETAILS.TRANTYPE
  is '来源单别(转单的单据类型)';
comment on column T_BUY_INQUIRY_DETAILS.FROMNO
  is '来源单号(转单的单据号)';
comment on column T_BUY_INQUIRY_DETAILS.BTYPE
  is '单据类型编号';
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
  is '采购请购单主表';
comment on column T_ORDER_BILL_MAIN.FLAG
  is '单据类型标记';
comment on column T_ORDER_BILL_MAIN.BILLNO
  is '单据编号';
comment on column T_ORDER_BILL_MAIN.BILLDATE
  is '单据日期';
comment on column T_ORDER_BILL_MAIN.CUSTOMERID
  is '供应商编号，外键';
comment on column T_ORDER_BILL_MAIN.ADDRESSID
  is '供应商地址编号';
comment on column T_ORDER_BILL_MAIN.ZIPCODE
  is '邮编';
comment on column T_ORDER_BILL_MAIN.CUSTADDRESS
  is '供应商地址';
comment on column T_ORDER_BILL_MAIN.FORMALCUST
  is '正式客户（1：是，0否）';
comment on column T_ORDER_BILL_MAIN.VALIDDATE
  is '有效日期';
comment on column T_ORDER_BILL_MAIN.SALESMAN
  is '请购人员名称';
comment on column T_ORDER_BILL_MAIN.DEPARTID
  is '请购部门编号';
comment on column T_ORDER_BILL_MAIN.PROJECTID
  is '所属项目编号';
comment on column T_ORDER_BILL_MAIN.CURRID
  is '币别';
comment on column T_ORDER_BILL_MAIN.EXCHRATE
  is '汇率';
comment on column T_ORDER_BILL_MAIN.MAKER
  is '制单人员';
comment on column T_ORDER_BILL_MAIN.PERMITTER
  is '复核人员';
comment on column T_ORDER_BILL_MAIN.DETAIL
  is '描述编号';
comment on column T_ORDER_BILL_MAIN.REMARK
  is '备注';
comment on column T_ORDER_BILL_MAIN.ISTRANS
  is '已转采购建议';
comment on column T_ORDER_BILL_MAIN.SUMBTAXAMT
  is '未税金额';
comment on column T_ORDER_BILL_MAIN.TAXTYPE
  is '课税类别';
comment on column T_ORDER_BILL_MAIN.SUMTAX
  is '税金';
comment on column T_ORDER_BILL_MAIN.SUMQTY
  is '数量合计';
comment on column T_ORDER_BILL_MAIN.BILLSTATUS
  is '单况（0：未结案，1：已
结案，2：无效）
';
comment on column T_ORDER_BILL_MAIN.MERGEOUTSTATE
  is '单据抛转状态标识';
comment on column T_ORDER_BILL_MAIN.BILLSTYLEID
  is '采购请购类型编号';
comment on column T_ORDER_BILL_MAIN.BILLSTYLENAME
  is '采购请购类型名称';
comment on column T_ORDER_BILL_MAIN.SIGNBACK
  is '签回';
comment on column T_ORDER_BILL_MAIN.HASCHECK
  is '是否过账（0:否，1：是）';

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
  is '类别编号';
comment on column T_PROD_PATTERN.CLASSNAME
  is '类别名称';
comment on column T_PROD_PATTERN.ENGNAME
  is '英文名称';
comment on column T_PROD_PATTERN.ACCINVENTTORYNAME
  is '存货科目';
comment on column T_PROD_PATTERN.SENDOUTWARE
  is '发出商品科目';
comment on column T_PROD_PATTERN.MEMO
  is '备注';
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
  is '物料编号';
comment on column T_PROD_MAIN.CLASSID
  is '物料类别ID';
comment on column T_PROD_MAIN.CLASSNAME
  is '类别名称';
comment on column T_PROD_MAIN.PRODNAME
  is '物料名称';
comment on column T_PROD_MAIN.PRODSIZE
  is '规格型号';
comment on column T_PROD_MAIN.ENGNAME
  is '英文名称';
comment on column T_PROD_MAIN.CURRNAME
  is '币别';
comment on column T_PROD_MAIN.SUGGESTPRICE
  is '建议售价';
comment on column T_PROD_MAIN.SALESPRICEA
  is '建议售价A';
comment on column T_PROD_MAIN.SALESPRICEB
  is '建议售价B';
comment on column T_PROD_MAIN.SALESPRICEC
  is '建议售价C';
comment on column T_PROD_MAIN.SALESPRICED
  is '建议售价D';
comment on column T_PROD_MAIN.SALESPRICEE
  is '建议售价E';
comment on column T_PROD_MAIN.STDPRICE
  is '标准进价';
comment on column T_PROD_MAIN.BUSITAXRATE
  is '税率';
comment on column T_PROD_MAIN.EFFECTDATEUSED
  is '使用出厂日期';
comment on column T_PROD_MAIN.VALIDATEUSED
  is '使用有效日期';
comment on column T_PROD_MAIN.DEFVALIDAY
  is '有效天数';
comment on column T_PROD_MAIN.PRODDESC
  is '备注';
comment on column T_PROD_MAIN.SAFEQTY
  is '安全存量';
comment on column T_PROD_MAIN.MAJONRSUPPLIERID
  is '主供应商编号';
comment on column T_PROD_MAIN.BOUTSTOCKDAY
  is '最初入库日';
comment on column T_PROD_MAIN.BINSTOCKDAY
  is '最近入库日';
comment on column T_PROD_MAIN.BSTDCOST
  is '标准成本';
comment on column T_PROD_MAIN.BAVGCOST
  is '标准平均成本';
comment on column T_PROD_MAIN.PRICEOFTAX
  is '单价是否含税';
comment on column T_PROD_MAIN.BTOTALCOST
  is '期初总成本';
comment on column T_PROD_MAIN.STDUNIT
  is '计量单位';
comment on column T_PROD_MAIN.BALLAMT
  is '起初总数量';
comment on column T_PROD_MAIN.BCURRSTOCK
  is '现有总数量';
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
  add constraint 关联类别 foreign key (CLASSID)
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
  is '单据编号';
comment on column T_QUOTATION.CUSTOMERID
  is '客户编号';
comment on column T_QUOTATION.BILLDATE
  is '单据日期';
comment on column T_QUOTATION.VALIDATES
  is '有效日期';
comment on column T_QUOTATION.ADDERSSID
  is '地址编号';
comment on column T_QUOTATION.CUSTCURRENCYNAME
  is '币别名称';
comment on column T_QUOTATION.PRICEOFTAX
  is '单价是否含税';
comment on column T_QUOTATION.EXCHRATE
  is '汇率';
comment on column T_QUOTATION.SALESID
  is '业务人员编号';
comment on column T_QUOTATION.MAKER
  is '制单人员';
comment on column T_QUOTATION.DAPARID
  is '部门编号';
comment on column T_QUOTATION.PERMITTER
  is '复核人员';
comment on column T_QUOTATION.REMARKS
  is '备注';
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
  is '单据编号';
comment on column T_QUOTATION_DETAIL.LINEID
  is '行号';
comment on column T_QUOTATION_DETAIL.PRODID
  is '物料编号';
comment on column T_QUOTATION_DETAIL.PRODNAME
  is '物料名称';
comment on column T_QUOTATION_DETAIL.PRODSIZE
  is '规格型号';
comment on column T_QUOTATION_DETAIL.STDUNITNAME
  is '单位名称';
comment on column T_QUOTATION_DETAIL.SUMS
  is '数量';
comment on column T_QUOTATION_DETAIL.DSCOUNT_FRONT_PRICE
  is '折扣前单价';
comment on column T_QUOTATION_DETAIL.BROKEN_NUMBER
  is '折数';
comment on column T_QUOTATION_DETAIL.PICE
  is '单价';
comment on column T_QUOTATION_DETAIL.MONEY
  is '金额';
comment on column T_QUOTATION_DETAIL.TAX_RATE
  is '税率';
comment on column T_QUOTATION_DETAIL.TAX
  is '含税';
comment on column T_QUOTATION_DETAIL.ISGIFT
  is '是否赠品';
comment on column T_QUOTATION_DETAIL.TAX_INCLUDED_MONEY
  is '含税金额';
comment on column T_QUOTATION_DETAIL.REMARKS
  is '备注';
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
  is '单据号码，主键';
comment on column T_RECEIVABLE.FUNDBILLDATE
  is '单据日期';
comment on column T_RECEIVABLE.CUSTOMERID
  is '客户编号';
comment on column T_RECEIVABLE.RCURRENCYNAME
  is '币别';
comment on column T_RECEIVABLE.CASHSTYLEID
  is '结算方式一';
comment on column T_RECEIVABLE.CASHSTYLEMONEY
  is '结算方式一金额';
comment on column T_RECEIVABLE.VISASTYLEID
  is '结算方式二';
comment on column T_RECEIVABLE.VISASTYLEMONEY
  is '结算方式二金额';
comment on column T_RECEIVABLE.OTHERPAYSTYLEID
  is '结算方式三';
comment on column T_RECEIVABLE.OTHERPAYSTYLEMONEY
  is '结算方式三金额';
comment on column T_RECEIVABLE.EXCHRATE
  is '汇率';
comment on column T_RECEIVABLE.DISCOUNTPER
  is '折扣率';
comment on column T_RECEIVABLE.ACCMONTHTOMONTH
  is '终止月账';
comment on column T_RECEIVABLE.DEPTFROMID
  is '部门编号';
comment on column T_RECEIVABLE.MAKERNAME
  is '制单人员';
comment on column T_RECEIVABLE.PERMITTERNAME
  is '复核人员';
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
  is '单据号码，主键';
comment on column T_RECEIVABLE_ADVANCE.FUNDBILLDATE
  is '单据日期';
comment on column T_RECEIVABLE_ADVANCE.CUSTOMERID
  is '客户编号';
comment on column T_RECEIVABLE_ADVANCE.RCURRENCYNAME
  is '币别';
comment on column T_RECEIVABLE_ADVANCE.CASHSTYLEID
  is '结算方式一';
comment on column T_RECEIVABLE_ADVANCE.CASHSTYLEMONEY
  is '结算方式一金额';
comment on column T_RECEIVABLE_ADVANCE.VISASTYLEID
  is '结算方式二';
comment on column T_RECEIVABLE_ADVANCE.VISASTYLEMONEY
  is '结算方式二金额';
comment on column T_RECEIVABLE_ADVANCE.OTHERPAYSTYLEID
  is '结算方式三';
comment on column T_RECEIVABLE_ADVANCE.OTHERPAYSTYLEMONEY
  is '结算方式三金额';
comment on column T_RECEIVABLE_ADVANCE.EXCHRATE
  is '汇率';
comment on column T_RECEIVABLE_ADVANCE.DISCOUNTPER
  is '折扣率';
comment on column T_RECEIVABLE_ADVANCE.ACCMONTHTOMONTH
  is '终止月账';
comment on column T_RECEIVABLE_ADVANCE.DEPTFROMID
  is '部门编号';
comment on column T_RECEIVABLE_ADVANCE.MAKERNAME
  is '制单人员';
comment on column T_RECEIVABLE_ADVANCE.PERMITTERNAME
  is '复核人员';
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
  is '单据号码';
comment on column T_RECEIVABLEADVANCE_DETAIL.LINEID
  is '栏号';
comment on column T_RECEIVABLEADVANCE_DETAIL.SOURCESORTING
  is '来源别';
comment on column T_RECEIVABLEADVANCE_DETAIL.SOURCESORTINGBILLNO
  is '来源单号';
comment on column T_RECEIVABLEADVANCE_DETAIL.CURPRECV
  is '预收余额';
comment on column T_RECEIVABLEADVANCE_DETAIL.CURMONEY
  is '预收金额';
comment on column T_RECEIVABLEADVANCE_DETAIL.ABSTRACTS
  is '摘要';
comment on column T_RECEIVABLEADVANCE_DETAIL.ADDFIELD1
  is '自定义一';
comment on column T_RECEIVABLEADVANCE_DETAIL.ADDFIELD2
  is '自定义二';
comment on column T_RECEIVABLEADVANCE_DETAIL.MEMO
  is '备注';
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
  is '单据编号';
comment on column T_RECEIVABLE_DETAIL.LINENO
  is '栏号';
comment on column T_RECEIVABLE_DETAIL.SOURCESORTING
  is '单别，（销售出库，退货单';
comment on column T_RECEIVABLE_DETAIL.ORGINBILLNO
  is '原单编号';
comment on column T_RECEIVABLE_DETAIL.ORGINBILLDATE
  is '原单日期';
comment on column T_RECEIVABLE_DETAIL.INVOICENO
  is '出库号码';
comment on column T_RECEIVABLE_DETAIL.CURRID
  is '币种';
comment on column T_RECEIVABLE_DETAIL.EXCHRATE
  is '汇率';
comment on column T_RECEIVABLE_DETAIL.TOTALMONEY
  is '原单金额';
comment on column T_RECEIVABLE_DETAIL.DISCOUNTMONEY
  is '折让金额';
comment on column T_RECEIVABLE_DETAIL.OFFSET
  is '冲款金额';
comment on column T_RECEIVABLE_DETAIL.NOWLEFT
  is '现行余额';
comment on column T_RECEIVABLE_DETAIL.OFFSETMONEY
  is '冲抵金额';
comment on column T_RECEIVABLE_DETAIL.CUSTID
  is '交易对象,客户';
comment on column T_RECEIVABLE_DETAIL.CUSTNAME
  is '交易对象名称';
comment on column T_RECEIVABLE_DETAIL.DEPTID
  is '部门编号';
comment on column T_RECEIVABLE_DETAIL.DEPARTNAME
  is '部门名称';
comment on column T_RECEIVABLE_DETAIL.PERSONNAME
  is '业务人员';
comment on column T_RECEIVABLE_DETAIL.ADDFIELD1
  is '自定义一';
comment on column T_RECEIVABLE_DETAIL.ADDFIELD2
  is '自定义二';
comment on column T_RECEIVABLE_DETAIL.MEMO
  is '备注';
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
  is '仓库编号';
comment on column T_STOREHOUSE.WAREHOUSENAME
  is '仓库名称';
comment on column T_STOREHOUSE.SHORTNAME
  is '仓库简称';
comment on column T_STOREHOUSE.ENGNAME
  is '英文名称';
comment on column T_STOREHOUSE.LINKNAME
  is '联系人';
comment on column T_STOREHOUSE.TELEPHONE
  is '联系人电话';
comment on column T_STOREHOUSE.WAREHOUSEADDRESS
  is '仓库地址';
comment on column T_STOREHOUSE.MEMO
  is '备注';
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
  is '单据编号';
comment on column T_REQUISITION.CALL_OUT
  is '调出仓库';
comment on column T_REQUISITION.CALL_IN
  is '调入从仓库';
comment on column T_REQUISITION.BILLDATE
  is '单据日期';
comment on column T_REQUISITION.MAKER
  is '制单人员';
comment on column T_REQUISITION.PERMITTER
  is '复核人员';
comment on column T_REQUISITION.REMARK
  is '备注';
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
  is '单据编号';
comment on column T_REQUISITION_DETAIL.LINID
  is '行号';
comment on column T_REQUISITION_DETAIL.PRODID
  is '物料编号';
comment on column T_REQUISITION_DETAIL.PRODNAME
  is '物料名称';
comment on column T_REQUISITION_DETAIL.PRODSIZE
  is '规格型号';
comment on column T_REQUISITION_DETAIL.STDUNITNAME
  is '单位名称';
comment on column T_REQUISITION_DETAIL.SUMS
  is '数量';
comment on column T_REQUISITION_DETAIL.LOT_NUMBER
  is '批号';
comment on column T_REQUISITION_DETAIL.REMARK
  is '备注';
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
  is '应付冲款单主表';
comment on column T_RUSHPRICE_HOST.RUSHPRICEHOSTID
  is '应付冲款单编号';
comment on column T_RUSHPRICE_HOST.FUNDBILLID
  is '来源单号';
comment on column T_RUSHPRICE_HOST.FUNDBILLDATE
  is '单据日期';
comment on column T_RUSHPRICE_HOST.CUSTOMERID
  is '供应商ID';
comment on column T_RUSHPRICE_HOST.CURR
  is '币别';
comment on column T_RUSHPRICE_HOST.CASHID_ONE
  is '应付结算方式一';
comment on column T_RUSHPRICE_HOST.CASHID_TWO
  is '应付结算方式二';
comment on column T_RUSHPRICE_HOST.CASHID_THREE
  is '应付结算方式三';
comment on column T_RUSHPRICE_HOST.CASH_ONE_PRICE
  is '应付结算方式一金额';
comment on column T_RUSHPRICE_HOST.CASH_TWO_PRICE
  is '应付结算方式二金额';
comment on column T_RUSHPRICE_HOST.CASH_THREE_PRICE
  is '应付结算方式三金额';
comment on column T_RUSHPRICE_HOST.CASHSUMPRICE
  is '应付结算总金额';
comment on column T_RUSHPRICE_HOST.EXCHRATE
  is '汇率';
comment on column T_RUSHPRICE_HOST.DISCOUNTPER
  is '折扣率';
comment on column T_RUSHPRICE_HOST.ACCMONTHTOMONTH
  is '终止帐月';
comment on column T_RUSHPRICE_HOST.DEPARTID
  is '所属部门ID';
comment on column T_RUSHPRICE_HOST.MAKERSIGN
  is '制单人员';
comment on column T_RUSHPRICE_HOST.PERMITTERSIGN
  is '复核人员';
comment on column T_RUSHPRICE_HOST.STATUS
  is '单据状态';
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
  is '应付冲款单内容表';
comment on column T_RUSHPRICE_CONTENT.RUSHPRICECONTENTID
  is '内容表编号';
comment on column T_RUSHPRICE_CONTENT.BILLTYPE
  is '来源单别';
comment on column T_RUSHPRICE_CONTENT.ORDERNO
  is '来源单号';
comment on column T_RUSHPRICE_CONTENT.FUNDBILLDATE
  is '原单单据日期';
comment on column T_RUSHPRICE_CONTENT.CUSTSHORTNAME
  is '交易对象(简称)';
comment on column T_RUSHPRICE_CONTENT.CUSTOMERNAME
  is '交易对象名称';
comment on column T_RUSHPRICE_CONTENT.DEPARTID
  is '部门编号';
comment on column T_RUSHPRICE_CONTENT.DEPARTNAME
  is '部门名称';
comment on column T_RUSHPRICE_CONTENT.PERSONNAME
  is '采购人员';
comment on column T_RUSHPRICE_CONTENT.CURR
  is '币别';
comment on column T_RUSHPRICE_CONTENT.EXCHRATE
  is '汇率';
comment on column T_RUSHPRICE_CONTENT.TOTAL
  is '原单金额';
comment on column T_RUSHPRICE_CONTENT.NOWLEFT
  is '现行余额';
comment on column T_RUSHPRICE_CONTENT.DISCOUNT
  is '折让金额';
comment on column T_RUSHPRICE_CONTENT.OFFSET
  is '冲款金额';
comment on column T_RUSHPRICE_CONTENT.OFFSETMONEY
  is '冲抵金额';
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
  is '应付冲款单取用预付表';
comment on column T_RUSHPRICE_TAKE.RUSHPRICETAKEID
  is '取用预付表编号ID';
comment on column T_RUSHPRICE_TAKE.BILLTYPE
  is '来源单别';
comment on column T_RUSHPRICE_TAKE.ORDERNO
  is '来源单号';
comment on column T_RUSHPRICE_TAKE.DEPARTID
  is '部门编号';
comment on column T_RUSHPRICE_TAKE.DEPARTNAME
  is '部门名称';
comment on column T_RUSHPRICE_TAKE.ORIGADDPREPAY
  is '取用预付金额';
comment on column T_RUSHPRICE_TAKE.DESCRIPTION
  is '来源摘要';
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
  is '单据编号关联销售出库单';
comment on column T_SET_RECEIVABLEL.LINEID
  is '行号';
comment on column T_SET_RECEIVABLEL.FUNDBILLID_RECEIBE
  is '应收冲款单单号';
comment on column T_SET_RECEIVABLEL.SOURCESORTING
  is '来源别（预收款单）';
comment on column T_SET_RECEIVABLEL.ORGINBILLNO
  is '来源单号';
comment on column T_SET_RECEIVABLEL.DEPTID
  is '部门编号';
comment on column T_SET_RECEIVABLEL.DEPARTNAME
  is '部门名称';
comment on column T_SET_RECEIVABLEL.SETMONEY
  is '取用预收金额';
comment on column T_SET_RECEIVABLEL.ABSTRACTS
  is '来源摘要';
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
  is '销售订单编号';
comment on column T_STOCKOUT_SON.LINE
  is '行号';
comment on column T_STOCKOUT_SON.PRODID
  is '物料编号';
comment on column T_STOCKOUT_SON.SUM
  is '数量';
comment on column T_STOCKOUT_SON.BEFOREPRICE
  is '折扣前单价';
comment on column T_STOCKOUT_SON.RATEOFDISCOUNT
  is '折数';
comment on column T_STOCKOUT_SON.LASTPRICE
  is '单价';
comment on column T_STOCKOUT_SON.PRICE
  is '金额';
comment on column T_STOCKOUT_SON.TAXATE
  is '税率';
comment on column T_STOCKOUT_SON.TAXATEPRICE
  is '税额';
comment on column T_STOCKOUT_SON.SUMPRICE
  is '含税金额';
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
  add constraint 引用出库单号 foreign key (BILLID)
  references T_STOCKOUT_MAIN (BILLID);
alter table T_STOCKOUT_SON
  add constraint 引用物料 foreign key (PRODID)
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
  is '库存流水单号';
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
  is '单据编号';
comment on column T_TJIA_MAIN.ADJUSTDATE
  is '单据日期';
comment on column T_TJIA_MAIN.BILLNO
  is '单据号码';
comment on column T_TJIA_MAIN.INCSUBJECTID
  is '增值科目';
comment on column T_TJIA_MAIN.VOUCHARNO
  is '凭证编号';
comment on column T_TJIA_MAIN.DECSUJECTID
  is '减值科目';
comment on column T_TJIA_MAIN.ADJUSTMENT
  is '调整方式';
comment on column T_TJIA_MAIN.MAKER
  is '制单人员';
comment on column T_TJIA_MAIN.PERMITTER
  is '复核人员';
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
  is '单据编号';
comment on column T_TJIA_DETAIL.LINEID
  is '行号';
comment on column T_TJIA_DETAIL.PRODID
  is '物料编号';
comment on column T_TJIA_DETAIL.PRODNAME
  is '物料名称';
comment on column T_TJIA_DETAIL.PRODSIZE
  is '规格型号';
comment on column T_TJIA_DETAIL.PCS
  is '单位';
comment on column T_TJIA_DETAIL.KCCOUNT
  is '库存量';
comment on column T_TJIA_DETAIL.AVGCBEN
  is '平均成本';
comment on column T_TJIA_DETAIL.PRICE
  is '单价';
comment on column T_TJIA_DETAIL.TJJINE
  is '调价金额';
comment on column T_TJIA_DETAIL.FLBEIZHU
  is '分录备注';
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
  is '单位编号';
comment on column T_UNTIL.UNTILNAME
  is '单位名称';
comment on column T_UNTIL.ENGNAME
  is '英文名称';
comment on column T_UNTIL.MEMO
  is '备注';
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
  is '仓库ID';
comment on column T_WARE_ALL.PRODID
  is '物料ID';
comment on column T_WARE_ALL.SUM
  is '数量';
comment on column T_WARE_ALL.ONEPRICE
  is '单价（现行平均成本）';
comment on column T_WARE_ALL.SUMPRICE
  is '金额（单价*数量）';
alter table T_WARE_ALL
  add constraint 关联仓库 foreign key (WAREHOUSEID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_WARE_ALL
  add constraint 关联物料 foreign key (PRODID)
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
  is '仓库ID';
comment on column T_WARE_PRICE.PRODID
  is '物料ID';
comment on column T_WARE_PRICE.BILLID
  is '单据ID';
comment on column T_WARE_PRICE.LINE
  is '行号';
comment on column T_WARE_PRICE.BILLTYPEID
  is '单号类型ID';
comment on column T_WARE_PRICE.SUM
  is '数量';
comment on column T_WARE_PRICE.ONEPRICE
  is '单价';
comment on column T_WARE_PRICE.SUMPRICE
  is '金额（单价*数量）';
alter table T_WARE_PRICE
  add constraint 仓库外键 foreign key (WAREHOUSEID)
  references T_WARE_MAIN (WAREHOUSEID);
alter table T_WARE_PRICE
  add constraint 物料外键 foreign key (PRODID)
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
  is '单据编号';
comment on column T_XSHOU_MAIN.CUSTOMERID
  is '客户';
comment on column T_XSHOU_MAIN.BILLDATE
  is '单据日期';
comment on column T_XSHOU_MAIN.BILLNO
  is '单据号码';
comment on column T_XSHOU_MAIN.ADDRESSID
  is '送货地址';
comment on column T_XSHOU_MAIN.BILLSTYLEID
  is '销售订单类型';
comment on column T_XSHOU_MAIN.CUSTBILLNO
  is '客户订单';
comment on column T_XSHOU_MAIN.PRICEOFTAX
  is '单价是否含税';
comment on column T_XSHOU_MAIN.CURCURRENCYNAME
  is '币别';
comment on column T_XSHOU_MAIN.EXCHRATE
  is '汇率';
comment on column T_XSHOU_MAIN.BILLSTATUS
  is '单况';
comment on column T_XSHOU_MAIN.SALESNAME
  is '业务人员';
comment on column T_XSHOU_MAIN.MAKER
  is '制单人员';
comment on column T_XSHOU_MAIN.DEPARTNAME
  is '所属部门';
comment on column T_XSHOU_MAIN.PERMITTER
  is '复核人员';
comment on column T_XSHOU_MAIN.PROJECTNAME
  is '所属部门';
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
  is '单据编号';
comment on column T_XSHOU_DETAIL.LINEID
  is '行号';
comment on column T_XSHOU_DETAIL.PRODNAME
  is '物料名称';
comment on column T_XSHOU_DETAIL.PRODID
  is '物料编号';
comment on column T_XSHOU_DETAIL.PRODSIZE
  is '规格型号';
comment on column T_XSHOU_DETAIL.PCS
  is '单位名称';
comment on column T_XSHOU_DETAIL.SUM
  is '数量';
comment on column T_XSHOU_DETAIL.ORDPRICE
  is '折扣前单价';
comment on column T_XSHOU_DETAIL.ZSHU
  is '折数';
comment on column T_XSHOU_DETAIL.PRICE
  is '单价';
comment on column T_XSHOU_DETAIL.MONEY
  is '金额';
comment on column T_XSHOU_DETAIL.SLU
  is '税率';
comment on column T_XSHOU_DETAIL.SMONEY
  is '税额';
comment on column T_XSHOU_DETAIL.HSMONEY
  is '含税金额';
comment on column T_XSHOU_DETAIL.YCKR
  is '预出库日';
comment on column T_XSHOU_DETAIL.WCSUM
  is '未出数量';
comment on column T_XSHOU_DETAIL.ZPIN
  is '赠品';
comment on column T_XSHOU_DETAIL.ZPBEIZHU
  is '分录备注';
comment on column T_XSHOU_DETAIL.WLZUHE
  is '物料组合';
comment on column T_XSHOU_DETAIL.LYDANBIE
  is '来源单别';
comment on column T_XSHOU_DETAIL.LYDANHAO
  is '来源单号';
comment on column T_XSHOU_DETAIL.SCHAN
  is '生产';
comment on column T_XSHOU_DETAIL.PCDANHAO
  is '排产单号';
comment on column T_XSHOU_DETAIL.YPCSUM
  is '已排产数量';
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
alter table T_STOCKOUT_MAIN disable constraint 客户编号;
alter table T_STOCKOUT_MAIN disable constraint 审核人;
alter table T_STOCKOUT_MAIN disable constraint 业务人员;
alter table T_STOCKOUT_MAIN disable constraint 引用仓库;
alter table T_STOCKOUT_MAIN disable constraint 制单人;
prompt Disabling foreign key constraints for T_ACCOUNT_SON...
alter table T_ACCOUNT_SON disable constraint 出库单号外键;
alter table T_ACCOUNT_SON disable constraint 客户ID;
prompt Disabling foreign key constraints for T_ACCOUNT_WATER...
alter table T_ACCOUNT_WATER disable constraint 单号外键;
prompt Disabling foreign key constraints for T_ADVANCE_HOST...
alter table T_ADVANCE_HOST disable constraint FK_CASHID_ONE;
alter table T_ADVANCE_HOST disable constraint FK_CASHID_THREE;
alter table T_ADVANCE_HOST disable constraint FK_CASHID_TWO;
prompt Disabling foreign key constraints for T_ADVANCE_DETAILS...
alter table T_ADVANCE_DETAILS disable constraint FK_DETAILS_DETAILSID;
prompt Disabling foreign key constraints for T_CUSTOM_ADDRESS_DETAIL...
alter table T_CUSTOM_ADDRESS_DETAIL disable constraint FK_CU_DE_1;
prompt Disabling foreign key constraints for T_PROD_MAIN...
alter table T_PROD_MAIN disable constraint 关联类别;
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
alter table T_STOCKOUT_SON disable constraint 引用出库单号;
alter table T_STOCKOUT_SON disable constraint 引用物料;
prompt Disabling foreign key constraints for T_TJIA_DETAIL...
alter table T_TJIA_DETAIL disable constraint WAI1;
prompt Disabling foreign key constraints for T_WARE_ALL...
alter table T_WARE_ALL disable constraint 关联仓库;
alter table T_WARE_ALL disable constraint 关联物料;
prompt Disabling foreign key constraints for T_WARE_PRICE...
alter table T_WARE_PRICE disable constraint 仓库外键;
alter table T_WARE_PRICE disable constraint 物料外键;
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
values (1, '采购部', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (2, '销售部', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (3, '研发部', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (4, '市场部', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (5, '生产部', null, null);
insert into DEPART (DEPARTID, DEPARTNAME, ENGNAME, MEMO)
values (111, '111', '111', '111');
commit;
prompt 6 records loaded
prompt Loading DOCUMENT_OFTYPE...
prompt Table is empty
prompt Loading D_TYPE...
insert into D_TYPE (ID, TYPENAME, ENAME)
values (1, '采购请购单', 'cgqgd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (2, '采购询价单', 'cgxjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (3, '采购订单', 'cgdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (4, '采购入库单', 'cgrkd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (5, '采购退货单', 'cgthd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (6, '采购分摊作业', 'cgftzy');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (7, '销售询价单', 'xsxjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (8, '销售订单', 'xsdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (9, '销售出库单', 'xsckd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (10, '销售退货单', 'xsthd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (11, '盘点单', 'pdd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (12, '调拨单', 'dbd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (13, '调价单', 'tjd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (14, '应收冲款单', 'ysckd');
insert into D_TYPE (ID, TYPENAME, ENAME)
values (15, '应付冲款单', 'yfckd');
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
values ('10001', 1, '小刘', '0', null, '432123434444', to_date('02-02-1997', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('10002', 2, '小王', '0', null, '432123434441', to_date('02-04-1996', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1003', 3, '小黄', '1', null, '432123431414', to_date('12-06-1997', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1004', 4, '小叶', '1', null, '432123434124', to_date('15-08-1996', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_POSTCODE, DOMICILE_POSTCODE, NOW_ADDRESS, EMERGENCY_LINKMAN, HOME_PHONE, EMERGENCY_POSTCODE, EMERGENCY_LINKPHONE, HOME_ADDRESS, EMERGENCY_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('1005', 5, '小关', '0', null, '432123442121', to_date('12-12-1995', 'dd-mm-yyyy'), null, null, to_date('05-05-2012', 'dd-mm-yyyy'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 5 records loaded
prompt Loading STOCKAPPRTION...
prompt Table is empty
prompt Loading SUPPLIERS...
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('CSXL', '3', 'CSXL', '长沙新良电脑有限公司', '长沙新良', '欧经理', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('HP', '1', 'HP', '惠普(中国)有限公司', '惠普', '朱采购', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('SHJJ', '1', 'SHJJ', '上海佳杰有限公司', '上海佳杰', '朱采购', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into SUPPLIERS (SID, STID, FUNDSATTRIBNAME, FULLNAME, SHORTNAME, PERSONNID, ENGFULLNAME, ENGSHORTNAME, CURRENCYID, CURRENCYRATE, TAXNO, CREDITRATING, AMOUNTQUOTA, REMAINQUOTA, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, AREA, PRINCIPAL, TELEPHONE, TELEPHONE1, TELEPHONE2, TELEPHONE3, MOBILE_TELEPHONE, BANK_ACCOUNT, BANK_OF_DEPOSIT, PORTRAITURE, URL, MAIL_BOX, TRADE, AMOUNT_OF_CAPITAL, TAX_REGISTRATION, PRIME1, PRIME2, RECENTLY1, RECENTLY2, MARKET_DAY, TERM_OF_PAYMENT, PAYMENT, FARE_TICKET_TYPE, MONTHLY, NO_MONEY, SUBJECT1, SUBJECT2, SUBJECT3, REMARKS)
values ('SZSM', '1', 'SZSM', '神州数码计算机有限公司', '神州数码', '朱采购', null, null, 'RMB', 1, 0, 'A', null, 0, 0, 0, 0, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 4 records loaded
prompt Loading SUPPLIERS_ACCOUNT_DETAIL...
prompt Table is empty
prompt Loading SUPPLIERS_ADDRESS...
prompt Table is empty
prompt Loading SUPPLIERS_TYPE...
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('1', '主要', 'zygys', '主要供应商');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('2', '一般', 'ybgys', '一般供应商');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('3', '委外厂', 'wwc', '委外厂');
insert into SUPPLIERS_TYPE (STID, MEMO, ENGNAME, CLASSNAME)
values ('4', '其他供应商', 'qtgys', '其他供应商');
commit;
prompt 4 records loaded
prompt Loading S_WATER_METER...
prompt Table is empty
prompt Loading T_CUSTOM_CLASS...
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('001', '大客户', null, null, null);
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('002', '普通客户', null, null, null);
insert into T_CUSTOM_CLASS (CLASSID, CLASSNAME, ENGNAME, REMARK, NEW_COLUMN)
values ('003', 'VIP客户', null, null, null);
commit;
prompt 3 records loaded
prompt Loading T_CUSTOMER...
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('001', null, '马化腾', '001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into T_CUSTOMER (CUSTID, FUNDSATTRIBUTION, FULLNAME, CLASSID, CUSTOMERABBREVIATION, AREANAME, ENGFULLNAME, CURRENCYNAME, CHIEFID, PERSONID, LINKMANID, TELEPHONE, CAPITALIZATION, ENGSHORNAME, EMAIL, MOBILETEL, WEBADDRESS, BANKACCOUNT, FAXNO, BANKNAME, RATEOFDISCOUNT, PRICERANK, PRICEOFTAX, BUILDUPDATE, LASTVISITDATE, BOOKVISITDATE, INVALIDDATE, AMOUNTQUOTA, REMAINQUATA, RECRWAY, RECEIVABLES, DAYOFCLOSE, CREDITLEVEL, INVOTYPENAME, ACCRECEIVABLE, STARTADVRECV, STARTRECEIVABLE, CURADVRECV, CURRECEIVABLE, NOTINVQUOTA, ACCADVRECV)
values ('002', null, '马小云', '002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
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
values ('01', '原料仓库', 'YLCK', 'YLCK', '邓俊伟', '17377731279', '湖南邵阳', '百宝库');
insert into T_WARE_MAIN (WAREHOUSEID, WAREHOUSENAME, ENGNAME, SHORTNAME, LINKNAME, TELEPHONE, WAREHOUSEADDRESS, MEMO)
values ('02', '马化腾的神秘宝箱', 'YLCK', 'YLCK', '马化腾', '17895621231', '上海', '我又亏了呢');
commit;
prompt 2 records loaded
prompt Loading T_STOCKOUT_MAIN...
insert into T_STOCKOUT_MAIN (BILLID, BILLDATE, BILLSTATUS, AUDITORID, DOCUMENTMAKERID, BUSINESSID, SUMAMTATAX, SUMNUM, SUMPRICE, CURRNAME, GATHERMONTH, GATHERSTYLE, GATHERDELAY, SALECLASSID, DELIVERYADDRESS, WAREID, CUSTID, TELEPHONE1, TELEPHONE2, MEMO)
values ('20180615001', to_date('15-06-2018', 'dd-mm-yyyy'), '未审核', null, '1003', '1003', 8000, 2, 7000, '人民币', '6', '无条件呢', 0, '0', '湖南邵阳', '02', '002', '17377731279', null, 'M24呢');
commit;
prompt 1 records loaded
prompt Loading T_ACCOUNT_SON...
prompt Table is empty
prompt Loading T_ACCOUNT_WATER...
prompt Table is empty
prompt Loading T_RUSHPRICE_CASH...
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (1, '转账');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (2, '汇票');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (3, '其他');
insert into T_RUSHPRICE_CASH (CASHID, CASHTYPE)
values (4, '其他');
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
values ('001', '001', '湖南株洲', '412000', null, null, '12345678901', null, null, null);
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
values ('BO1', '主机包装物', null, '包装物', '发出商品', null);
insert into T_PROD_PATTERN (CLASSID, CLASSNAME, ENGNAME, ACCINVENTTORYNAME, SENDOUTWARE, MEMO)
values ('BO3', '运输包装物', null, '包装物', '发出商品', '易碎');
insert into T_PROD_PATTERN (CLASSID, CLASSNAME, ENGNAME, ACCINVENTTORYNAME, SENDOUTWARE, MEMO)
values ('BO2', '彩屏包装物', null, '包装物', '发出商品', null);
commit;
prompt 3 records loaded
prompt Loading T_PROD_MAIN...
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-307', 'BO3', '运输包装物', 'AWM', '马格南', null, '人民币', 1000, 1100, 1101, 1102, 1150, 1200, 500, 17, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('01-12-2018', 'dd-mm-yyyy'), 120, '一枪一个小朋友', 20, null, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('13-06-2018', 'dd-mm-yyyy'), 10200, 510, 'yes', 10000, '把', 20, 20);
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-308', 'BO3', '运输包装物', 'M24', '7.62', null, '人民币', 800, 900, 901, 902, 950, 966, 400, 17, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('01-10-2018', 'dd-mm-yyyy'), 80, '秒杀你呢', 20, null, to_date('11-06-2018', 'dd-mm-yyyy'), to_date('13-06-2018', 'dd-mm-yyyy'), 8200, 410, 'yes', 8000, '把', 20, 20);
insert into T_PROD_MAIN (PRODID, CLASSID, CLASSNAME, PRODNAME, PRODSIZE, ENGNAME, CURRNAME, SUGGESTPRICE, SALESPRICEA, SALESPRICEB, SALESPRICEC, SALESPRICED, SALESPRICEE, STDPRICE, BUSITAXRATE, EFFECTDATEUSED, VALIDATEUSED, DEFVALIDAY, PRODDESC, SAFEQTY, MAJONRSUPPLIERID, BOUTSTOCKDAY, BINSTOCKDAY, BSTDCOST, BAVGCOST, PRICEOFTAX, BTOTALCOST, STDUNIT, BALLAMT, BCURRSTOCK)
values ('C01-W-HP-DC7900-309', 'BO1', '主机包装物', '拯救者', 'I7', null, '人民币', 8000, 8100, 8110, 8150, 8200, 8196, 3100, 17, to_date('21-06-2018', 'dd-mm-yyyy'), to_date('01-06-2020', 'dd-mm-yyyy'), 660, '一天一蓝屏', 10, null, to_date('21-06-2018', 'dd-mm-yyyy'), to_date('29-06-2018', 'dd-mm-yyyy'), 30000, 3000, 'yes', 280000, '台', 10, 10);
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
values ('20180611001', 1, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2台式机1', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '备注1');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611002', 2, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2台式机2', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '备注2');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611004', 3, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2台式机3', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '备注3');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611003', 4, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2台式机4', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '备注4');
insert into T_QUOTATION_DETAIL (BILLNO, LINEID, PRODID, PRODNAME, PRODSIZE, STDUNITNAME, SUMS, DSCOUNT_FRONT_PRICE, BROKEN_NUMBER, PICE, MONEY, TAX_RATE, TAX, ISGIFT, TAX_INCLUDED_MONEY, REMARKS)
values ('20180611005', 5, 'C01-W-HP-DC7900-309', 'HP DC7900CMT-NA307PA#AB2台式机5', null, 'PCS', 10, 446, 100, 446, 600, 17, 292, 1, 100, '备注5');
commit;
prompt 5 records loaded
prompt Loading T_RECEIVABLE...
prompt Table is empty
prompt Loading T_RECEIVABLE_ADVANCE...
insert into T_RECEIVABLE_ADVANCE (FUNDBILLID, FUNDBILLDATE, CUSTOMERID, RCURRENCYNAME, CASHSTYLEID, CASHSTYLEMONEY, VISASTYLEID, VISASTYLEMONEY, OTHERPAYSTYLEID, OTHERPAYSTYLEMONEY, EXCHRATE, DISCOUNTPER, ACCMONTHTOMONTH, DEPTFROMID, MAKERNAME, PERMITTERNAME)
values ('2018061501', to_date('15-06-2018', 'dd-mm-yyyy'), '001', '人民币', '转账', 1000, '汇票', 500, null, null, 0, 0, to_date('20-06-2018', 'dd-mm-yyyy'), 2, 'admin', 'admin');
commit;
prompt 1 records loaded
prompt Loading T_RECEIVABLEADVANCE_DETAIL...
insert into T_RECEIVABLEADVANCE_DETAIL (FUNDBILLID, LINEID, SOURCESORTING, SOURCESORTINGBILLNO, CURPRECV, CURMONEY, ABSTRACTS, ADDFIELD1, ADDFIELD2, MEMO)
values ('2018061501', '1', '销售订单', '2018060601', 1000, 1000, '预收1000', null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_RECEIVABLE_DETAIL...
prompt Table is empty
prompt Loading T_STOREHOUSE...
prompt Table is empty
prompt Loading T_REQUISITION...
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612001', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '张制单', '张审核', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612002', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '王制单', '王审核', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612003', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '李制单', '李制单', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612004', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '大制单', '大制单', null);
insert into T_REQUISITION (BILLNO, CALL_OUT, CALL_IN, BILLDATE, MAKER, PERMITTER, REMARK)
values ('20180612005', null, null, to_date('12-06-2018', 'dd-mm-yyyy'), '小制单', '小制单', null);
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
values ('1', to_date('11-06-2018', 'dd-mm-yyyy'), '2016-1-1', 'z', 'z', 'z', '调单价', 'admin', 'a');
insert into T_TJIA_MAIN (ID, ADJUSTDATE, BILLNO, INCSUBJECTID, VOUCHARNO, DECSUJECTID, ADJUSTMENT, MAKER, PERMITTER)
values ('2', to_date('04-06-2018', 'dd-mm-yyyy'), '2016111', 's', 's', 's', '调金额', 'admin', 'b');
insert into T_TJIA_MAIN (ID, ADJUSTDATE, BILLNO, INCSUBJECTID, VOUCHARNO, DECSUJECTID, ADJUSTMENT, MAKER, PERMITTER)
values ('3', to_date('01-06-2018', 'dd-mm-yyyy'), '201801231', 'a', 'a', 'a', '调单价', 'admin', 'c');
commit;
prompt 3 records loaded
prompt Loading T_TJIA_DETAIL...
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('1', '1', 'wc-1', '液晶显示器', '不详', 'pm', 100, 1311, 1600, 11, '恩');
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('2', '2', 'wc-2', '联想电脑', '不详', 'pm', 99, 2000, 2111, 12, '额');
insert into T_TJIA_DETAIL (ID, LINEID, PRODID, PRODNAME, PRODSIZE, PCS, KCCOUNT, AVGCBEN, PRICE, TJJINE, FLBEIZHU)
values ('3', '3', 'wc-3', '华锁', '不详', '平pm', 98, 2111, 2333, 20, '恩');
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
values ('1', '株洲伟大', to_date('11-06-2018', 'dd-mm-yyyy'), '201802031', '不详', '不详', '不详', '含税', '人民币', 1, '未结案', '刘经理', 'admin', '渠道部', 'admin', '不详');
insert into T_XSHOU_MAIN (ID, CUSTOMERID, BILLDATE, BILLNO, ADDRESSID, BILLSTYLEID, CUSTBILLNO, PRICEOFTAX, CURCURRENCYNAME, EXCHRATE, BILLSTATUS, SALESNAME, MAKER, DEPARTNAME, PERMITTER, PROJECTNAME)
values ('2', '株洲健坤', to_date('07-06-2018', 'dd-mm-yyyy'), '20180303', '不详', '不详', '不详', '未税', '人民币', 1, '已结案', '张经理', 'admin', '渠道部', 'admin', '不详');
insert into T_XSHOU_MAIN (ID, CUSTOMERID, BILLDATE, BILLNO, ADDRESSID, BILLSTYLEID, CUSTBILLNO, PRICEOFTAX, CURCURRENCYNAME, EXCHRATE, BILLSTATUS, SALESNAME, MAKER, DEPARTNAME, PERMITTER, PROJECTNAME)
values ('3', '上海铺家', to_date('03-06-2018', 'dd-mm-yyyy'), '2018033001', '不详', '不详', '不详', '含税', '人民币', 1, '未结案', '付董事长', 'admin', '渠道部', 'admin', '不详');
commit;
prompt 3 records loaded
prompt Loading T_XSHOU_DETAIL...
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('1', '4', 'HP DX2710MT- NA296PA#AB2一体机s', 'C01-W-HP-DX2710-299', '不详', 'pm', 12, 1512, 158, 15132, 132123, 17, 1213, 123132, to_date('15-06-2018', 'dd-mm-yyyy'), 10, '无', '不知道', '无', '来源单别', '来源单号', '无', '无', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('1', '1', 'HP DX2710MT- NA296PA#AB2台式机', 'C01-W-HP-DX2710-296', '不详', 'pm', 10, 1611, 60, 1200, 12000, 17, 1052, 13001, to_date('11-06-2018', 'dd-mm-yyyy'), 10, '无', '不知道', '无', '来源单别', '来源单号', '无', '无', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('2', '2', 'HP DX2710MT- NA296PA#AB2笔记本', 'C01-W-HP-DX2710-297', '不详', 'pm', 11, 1412, 12, 200, 2200, 17, 1200, 12021, to_date('01-06-2018', 'dd-mm-yyyy'), 10, '无', '不知道', '无', '来源单别', '来源单号', '无', '无', 0);
insert into T_XSHOU_DETAIL (ID, LINEID, PRODNAME, PRODID, PRODSIZE, PCS, SUM, ORDPRICE, ZSHU, PRICE, MONEY, SLU, SMONEY, HSMONEY, YCKR, WCSUM, ZPIN, ZPBEIZHU, WLZUHE, LYDANBIE, LYDANHAO, SCHAN, PCDANHAO, YPCSUM)
values ('3', '3', 'HP DX2710MT- NA296PA#AB2一体机', 'C01-W-HP-DX2710-298', '不详', 'pm', 12, 1520, 100, 1520, 1211, 17, 1511, 15811, to_date('05-06-2018', 'dd-mm-yyyy'), 10, '无', '不知道', '无', '来源单别', '来源单号', '无', '无', 0);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for PURCHASING_TOWARE_DETAILS...
alter table PURCHASING_TOWARE_DETAILS enable constraint FK_PERMITTER;
prompt Enabling foreign key constraints for STAFF_MASTER_FILE...
alter table STAFF_MASTER_FILE enable constraint FK_DEPARTMENTID;
prompt Enabling foreign key constraints for T_CUSTOMER...
alter table T_CUSTOMER enable constraint FK_CU_1;
prompt Enabling foreign key constraints for T_STOCKOUT_MAIN...
alter table T_STOCKOUT_MAIN enable constraint 客户编号;
alter table T_STOCKOUT_MAIN enable constraint 审核人;
alter table T_STOCKOUT_MAIN enable constraint 业务人员;
alter table T_STOCKOUT_MAIN enable constraint 引用仓库;
alter table T_STOCKOUT_MAIN enable constraint 制单人;
prompt Enabling foreign key constraints for T_ACCOUNT_SON...
alter table T_ACCOUNT_SON enable constraint 出库单号外键;
alter table T_ACCOUNT_SON enable constraint 客户ID;
prompt Enabling foreign key constraints for T_ACCOUNT_WATER...
alter table T_ACCOUNT_WATER enable constraint 单号外键;
prompt Enabling foreign key constraints for T_ADVANCE_HOST...
alter table T_ADVANCE_HOST enable constraint FK_CASHID_ONE;
alter table T_ADVANCE_HOST enable constraint FK_CASHID_THREE;
alter table T_ADVANCE_HOST enable constraint FK_CASHID_TWO;
prompt Enabling foreign key constraints for T_ADVANCE_DETAILS...
alter table T_ADVANCE_DETAILS enable constraint FK_DETAILS_DETAILSID;
prompt Enabling foreign key constraints for T_CUSTOM_ADDRESS_DETAIL...
alter table T_CUSTOM_ADDRESS_DETAIL enable constraint FK_CU_DE_1;
prompt Enabling foreign key constraints for T_PROD_MAIN...
alter table T_PROD_MAIN enable constraint 关联类别;
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
alter table T_STOCKOUT_SON enable constraint 引用出库单号;
alter table T_STOCKOUT_SON enable constraint 引用物料;
prompt Enabling foreign key constraints for T_TJIA_DETAIL...
alter table T_TJIA_DETAIL enable constraint WAI1;
prompt Enabling foreign key constraints for T_WARE_ALL...
alter table T_WARE_ALL enable constraint 关联仓库;
alter table T_WARE_ALL enable constraint 关联物料;
prompt Enabling foreign key constraints for T_WARE_PRICE...
alter table T_WARE_PRICE enable constraint 仓库外键;
alter table T_WARE_PRICE enable constraint 物料外键;
prompt Enabling foreign key constraints for T_XSHOU_DETAIL...
alter table T_XSHOU_DETAIL enable constraint WAI;
set feedback on
set define on
prompt Done.
