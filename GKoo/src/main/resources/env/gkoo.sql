PGDMP     !                     x            gkoo    11.5    11.5 ~    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16393    gkoo    DATABASE     �   CREATE DATABASE gkoo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'German_Germany.1252' LC_CTYPE = 'German_Germany.1252';
    DROP DATABASE gkoo;
             postgres    false            �           1247    24853    answer_state    TYPE     Z   CREATE TYPE public.answer_state AS ENUM (
    'READY_TO_ANSWER',
    'COMPLETE_ANSWER'
);
    DROP TYPE public.answer_state;
       public       postgres    false            �            1259    24892    buying_service    TABLE     G  CREATE TABLE public.buying_service (
    object_id integer NOT NULL,
    userid character varying(50) NOT NULL,
    orderid character varying(50) NOT NULL,
    buying_price numeric,
    buying_service_state integer,
    ship_price numeric,
    box_actual_weight numeric,
    box_volume_weight numeric,
    tracking_company_kor character varying(50),
    tracking_company_world character varying(50),
    trackingnr_kor character varying(50),
    trackingnr_world character varying(50),
    shop_url character varying(50),
    order_date date,
    product_list_total_price numeric
);
 "   DROP TABLE public.buying_service;
       public         postgres    false            �            1259    24890    buying_service_object_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buying_service_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.buying_service_object_id_seq;
       public       postgres    false    219            �           0    0    buying_service_object_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.buying_service_object_id_seq OWNED BY public.buying_service.object_id;
            public       postgres    false    218            �            1259    24951    buying_service_payment    TABLE     �  CREATE TABLE public.buying_service_payment (
    object_id integer NOT NULL,
    buying_deposit_payment numeric,
    shipping_deposit_payment numeric,
    buying_payment_date date,
    shipping_payment_date date,
    buying_deposit_ownername character varying(50),
    shipping_deposit_ownername character varying(50),
    payment_art integer,
    buying_service_payment_state integer,
    fk_buying_service integer,
    payment_art_shipping_price numeric
);
 *   DROP TABLE public.buying_service_payment;
       public         postgres    false            �            1259    24949 $   buying_service_payment_object_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buying_service_payment_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.buying_service_payment_object_id_seq;
       public       postgres    false    223            �           0    0 $   buying_service_payment_object_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.buying_service_payment_object_id_seq OWNED BY public.buying_service_payment.object_id;
            public       postgres    false    222            �            1259    24983    buying_service_product    TABLE     Y  CREATE TABLE public.buying_service_product (
    object_id integer NOT NULL,
    pd_categorytitle character varying(50),
    pd_itemtitle character varying(50),
    pd_brandname character varying(50),
    pd_itemname character varying(50),
    pd_amount integer,
    pd_price numeric,
    pd_totalprice numeric,
    fk_buying_service integer
);
 *   DROP TABLE public.buying_service_product;
       public         postgres    false            �            1259    24981 $   buying_service_product_object_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buying_service_product_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.buying_service_product_object_id_seq;
       public       postgres    false    225            �           0    0 $   buying_service_product_object_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.buying_service_product_object_id_seq OWNED BY public.buying_service_product.object_id;
            public       postgres    false    224            �            1259    24935    buying_service_recipient    TABLE     �  CREATE TABLE public.buying_service_recipient (
    object_id integer NOT NULL,
    name_kor character varying(50) NOT NULL,
    name_eng character varying(50),
    transit_nr character varying(50),
    phonenumber_first character varying(50),
    phonenumber_second character varying(50),
    zip_code character varying(10),
    address text,
    usercomment text,
    fk_buying_service integer
);
 ,   DROP TABLE public.buying_service_recipient;
       public         postgres    false            �            1259    24933 &   buying_service_recipient_object_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buying_service_recipient_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.buying_service_recipient_object_id_seq;
       public       postgres    false    221            �           0    0 &   buying_service_recipient_object_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.buying_service_recipient_object_id_seq OWNED BY public.buying_service_recipient.object_id;
            public       postgres    false    220            �            1259    24804    customer    TABLE     }  CREATE TABLE public.customer (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    name_kor character varying(50) NOT NULL,
    name_eng character varying(50),
    email text,
    transit_nr character varying(50),
    phonenumber_first character varying(50),
    phonenumber_second character varying(50),
    zip_code character varying(10),
    address text
);
    DROP TABLE public.customer;
       public         postgres    false            �            1259    24802    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public       postgres    false    211            �           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
            public       postgres    false    210            �            1259    16402    customerstatus    TABLE     �   CREATE TABLE public.customerstatus (
    id integer NOT NULL,
    gkoo_id text,
    insuranceamount integer NOT NULL,
    depositeamount integer NOT NULL,
    pointamount integer NOT NULL
);
 "   DROP TABLE public.customerstatus;
       public         postgres    false            �            1259    16408    customerstatus_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.customerstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customerstatus_id_seq;
       public       postgres    false    196            �           0    0    customerstatus_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customerstatus_id_seq OWNED BY public.customerstatus.id;
            public       postgres    false    197            �            1259    16612    favorite_address    TABLE     u  CREATE TABLE public.favorite_address (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    name_kor character varying(50) NOT NULL,
    name_eng character varying(50),
    transit_nr character varying(50),
    phonenumber_first character varying(50),
    phonenumber_second character varying(50),
    zip_code character varying(10),
    address text
);
 $   DROP TABLE public.favorite_address;
       public         postgres    false            �            1259    16610    favorite_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorite_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorite_address_id_seq;
       public       postgres    false    209            �           0    0    favorite_address_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.favorite_address_id_seq OWNED BY public.favorite_address.id;
            public       postgres    false    208            �            1259    24870    notices    TABLE     �   CREATE TABLE public.notices (
    noticeid integer NOT NULL,
    notice_title character varying(50) NOT NULL,
    notice_content text NOT NULL,
    notice_date date
);
    DROP TABLE public.notices;
       public         postgres    false            �            1259    24868    notices_noticeid_seq    SEQUENCE     �   CREATE SEQUENCE public.notices_noticeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notices_noticeid_seq;
       public       postgres    false    215            �           0    0    notices_noticeid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notices_noticeid_seq OWNED BY public.notices.noticeid;
            public       postgres    false    214            �            1259    16416 
   orderstate    TABLE       CREATE TABLE public.orderstate (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    orderid character varying(50) NOT NULL,
    ship_price numeric,
    ship_state integer,
    trackingnr_kor character varying(50),
    trackingnr_world character varying(50),
    box_actual_weight numeric,
    box_volume_weight numeric,
    ship_price_discount numeric,
    tracking_company_kor character varying(50),
    tracking_company_world character varying(50),
    shop_url character varying(50),
    order_date date
);
    DROP TABLE public.orderstate;
       public         postgres    false            �           0    0    COLUMN orderstate.orderid    COMMENT     ?   COMMENT ON COLUMN public.orderstate.orderid IS '주문번호';
            public       postgres    false    198            �           0    0    COLUMN orderstate.ship_state    COMMENT     �   COMMENT ON COLUMN public.orderstate.ship_state IS '입고대기 (1),
입고완료 (2),
결제요청 (3),
결제완료 (4),
해외배송중 (5),
통관진행 (6),
국내배송 (7),
배송완료 (8)
';
            public       postgres    false    198            �            1259    16422    orderstate_id_seq    SEQUENCE     z   CREATE SEQUENCE public.orderstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.orderstate_id_seq;
       public       postgres    false    198            �           0    0    orderstate_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.orderstate_id_seq OWNED BY public.orderstate.id;
            public       postgres    false    199            �            1259    16424    payment    TABLE     ^  CREATE TABLE public.payment (
    paymentid integer NOT NULL,
    userid character varying(50) NOT NULL,
    orderid character varying(50) NOT NULL,
    payment_date timestamp without time zone,
    payment_ownername character varying(50),
    payment_art integer,
    payment_deposit numeric,
    payment_state integer,
    fk_orderstate integer
);
    DROP TABLE public.payment;
       public         postgres    false            �           0    0    COLUMN payment.payment_state    COMMENT     �   COMMENT ON COLUMN public.payment.payment_state IS '1 결제대기 - 결제전
2 결제요청 - 무통장입금전
3 결제완료';
            public       postgres    false    200            �            1259    16430    payment_paymentid_seq    SEQUENCE     ~   CREATE SEQUENCE public.payment_paymentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.payment_paymentid_seq;
       public       postgres    false    200            �           0    0    payment_paymentid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.payment_paymentid_seq OWNED BY public.payment.paymentid;
            public       postgres    false    201            �            1259    16432    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    memberid character varying(50) NOT NULL,
    orderid character varying(50) NOT NULL,
    order_stamp timestamp without time zone NOT NULL,
    pd_categorytitle character varying(50),
    pd_itemtitle character varying(50),
    pd_brandname character varying(50),
    pd_itemname character varying(50),
    pd_amount integer NOT NULL,
    pd_price numeric NOT NULL,
    pd_totalprice numeric NOT NULL
);
    DROP TABLE public.product;
       public         postgres    false            �            1259    16438    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public       postgres    false    202            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
            public       postgres    false    203            �            1259    16440    purchaseorder    TABLE       CREATE TABLE public.purchaseorder (
    id integer NOT NULL,
    gkooid text,
    productname character varying(50) NOT NULL,
    productimageurl text,
    productprice integer NOT NULL,
    servicefee integer NOT NULL,
    totalprice integer NOT NULL,
    delieverstatus text
);
 !   DROP TABLE public.purchaseorder;
       public         postgres    false            �            1259    16446    purchaseorder_id_seq    SEQUENCE     }   CREATE SEQUENCE public.purchaseorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.purchaseorder_id_seq;
       public       postgres    false    204            �           0    0    purchaseorder_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.purchaseorder_id_seq OWNED BY public.purchaseorder.id;
            public       postgres    false    205            �            1259    24881    question_answer    TABLE     <  CREATE TABLE public.question_answer (
    qnaid integer NOT NULL,
    question_title character varying(50) NOT NULL,
    question_content text NOT NULL,
    question_date date NOT NULL,
    answer_content text,
    answer_state public.answer_state,
    answer_date date,
    userid character varying(50) NOT NULL
);
 #   DROP TABLE public.question_answer;
       public         postgres    false    663            �            1259    24879    question_answer_qnaid_seq    SEQUENCE     �   CREATE SEQUENCE public.question_answer_qnaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.question_answer_qnaid_seq;
       public       postgres    false    217            �           0    0    question_answer_qnaid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.question_answer_qnaid_seq OWNED BY public.question_answer.qnaid;
            public       postgres    false    216            �            1259    24837 	   recipient    TABLE     �  CREATE TABLE public.recipient (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    orderid character varying(50) NOT NULL,
    name_kor character varying(50) NOT NULL,
    name_eng character varying(50),
    transit_nr character varying(50),
    phonenumber_first character varying(50),
    phonenumber_second character varying(50),
    zip_code character varying(10),
    address text,
    usercomment text
);
    DROP TABLE public.recipient;
       public         postgres    false            �            1259    24835    recipient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.recipient_id_seq;
       public       postgres    false    213            �           0    0    recipient_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.recipient_id_seq OWNED BY public.recipient.id;
            public       postgres    false    212            �            1259    16456 
   settlement    TABLE     /  CREATE TABLE public.settlement (
    settlement_date date,
    item_id text NOT NULL,
    "transactionMoney" integer,
    "depositMoney" integer,
    item_name text,
    "itemFotoUrl" text,
    "purchasePrice" integer,
    "shippingPrice" integer,
    "settleAmount" integer,
    id integer NOT NULL
);
    DROP TABLE public.settlement;
       public         postgres    false            �           0    0    TABLE settlement    COMMENT     A   COMMENT ON TABLE public.settlement IS '결제내역 테이블
';
            public       postgres    false    206            �           0    0    COLUMN settlement.item_id    COMMENT     A   COMMENT ON COLUMN public.settlement.item_id IS 'gkoo 아이디';
            public       postgres    false    206            �           0    0 $   COLUMN settlement."transactionMoney"    COMMENT     G   COMMENT ON COLUMN public.settlement."transactionMoney" IS '입금액';
            public       postgres    false    206            �           0    0     COLUMN settlement."depositMoney"    COMMENT     C   COMMENT ON COLUMN public.settlement."depositMoney" IS '적립금';
            public       postgres    false    206            �           0    0    COLUMN settlement.item_name    COMMENT     F   COMMENT ON COLUMN public.settlement.item_name IS '아이템 이름
';
            public       postgres    false    206            �           0    0    COLUMN settlement."itemFotoUrl"    COMMENT     C   COMMENT ON COLUMN public.settlement."itemFotoUrl" IS 'image url ';
            public       postgres    false    206            �           0    0 !   COLUMN settlement."purchasePrice"    COMMENT     I   COMMENT ON COLUMN public.settlement."purchasePrice" IS '구매 금액
';
            public       postgres    false    206            �           0    0 !   COLUMN settlement."shippingPrice"    COMMENT     K   COMMENT ON COLUMN public.settlement."shippingPrice" IS '국제 배송비';
            public       postgres    false    206            �           0    0     COLUMN settlement."settleAmount"    COMMENT     N   COMMENT ON COLUMN public.settlement."settleAmount" IS '최종 정산 금액';
            public       postgres    false    206            �            1259    16462    settlement_id_seq    SEQUENCE     z   CREATE SEQUENCE public.settlement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.settlement_id_seq;
       public       postgres    false    206            �           0    0    settlement_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.settlement_id_seq OWNED BY public.settlement.id;
            public       postgres    false    207            �
           2604    24895    buying_service object_id    DEFAULT     �   ALTER TABLE ONLY public.buying_service ALTER COLUMN object_id SET DEFAULT nextval('public.buying_service_object_id_seq'::regclass);
 G   ALTER TABLE public.buying_service ALTER COLUMN object_id DROP DEFAULT;
       public       postgres    false    219    218    219            �
           2604    24954     buying_service_payment object_id    DEFAULT     �   ALTER TABLE ONLY public.buying_service_payment ALTER COLUMN object_id SET DEFAULT nextval('public.buying_service_payment_object_id_seq'::regclass);
 O   ALTER TABLE public.buying_service_payment ALTER COLUMN object_id DROP DEFAULT;
       public       postgres    false    222    223    223            �
           2604    24986     buying_service_product object_id    DEFAULT     �   ALTER TABLE ONLY public.buying_service_product ALTER COLUMN object_id SET DEFAULT nextval('public.buying_service_product_object_id_seq'::regclass);
 O   ALTER TABLE public.buying_service_product ALTER COLUMN object_id DROP DEFAULT;
       public       postgres    false    225    224    225            �
           2604    24938 "   buying_service_recipient object_id    DEFAULT     �   ALTER TABLE ONLY public.buying_service_recipient ALTER COLUMN object_id SET DEFAULT nextval('public.buying_service_recipient_object_id_seq'::regclass);
 Q   ALTER TABLE public.buying_service_recipient ALTER COLUMN object_id DROP DEFAULT;
       public       postgres    false    220    221    221            �
           2604    24807    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    16465    customerstatus id    DEFAULT     v   ALTER TABLE ONLY public.customerstatus ALTER COLUMN id SET DEFAULT nextval('public.customerstatus_id_seq'::regclass);
 @   ALTER TABLE public.customerstatus ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    16615    favorite_address id    DEFAULT     z   ALTER TABLE ONLY public.favorite_address ALTER COLUMN id SET DEFAULT nextval('public.favorite_address_id_seq'::regclass);
 B   ALTER TABLE public.favorite_address ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    24873    notices noticeid    DEFAULT     t   ALTER TABLE ONLY public.notices ALTER COLUMN noticeid SET DEFAULT nextval('public.notices_noticeid_seq'::regclass);
 ?   ALTER TABLE public.notices ALTER COLUMN noticeid DROP DEFAULT;
       public       postgres    false    215    214    215            �
           2604    16466    orderstate id    DEFAULT     n   ALTER TABLE ONLY public.orderstate ALTER COLUMN id SET DEFAULT nextval('public.orderstate_id_seq'::regclass);
 <   ALTER TABLE public.orderstate ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    16467    payment paymentid    DEFAULT     v   ALTER TABLE ONLY public.payment ALTER COLUMN paymentid SET DEFAULT nextval('public.payment_paymentid_seq'::regclass);
 @   ALTER TABLE public.payment ALTER COLUMN paymentid DROP DEFAULT;
       public       postgres    false    201    200            �
           2604    16468 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            �
           2604    16469    purchaseorder id    DEFAULT     t   ALTER TABLE ONLY public.purchaseorder ALTER COLUMN id SET DEFAULT nextval('public.purchaseorder_id_seq'::regclass);
 ?   ALTER TABLE public.purchaseorder ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    24884    question_answer qnaid    DEFAULT     ~   ALTER TABLE ONLY public.question_answer ALTER COLUMN qnaid SET DEFAULT nextval('public.question_answer_qnaid_seq'::regclass);
 D   ALTER TABLE public.question_answer ALTER COLUMN qnaid DROP DEFAULT;
       public       postgres    false    217    216    217            �
           2604    24840    recipient id    DEFAULT     l   ALTER TABLE ONLY public.recipient ALTER COLUMN id SET DEFAULT nextval('public.recipient_id_seq'::regclass);
 ;   ALTER TABLE public.recipient ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    16471    settlement id    DEFAULT     n   ALTER TABLE ONLY public.settlement ALTER COLUMN id SET DEFAULT nextval('public.settlement_id_seq'::regclass);
 <   ALTER TABLE public.settlement ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �          0    24892    buying_service 
   TABLE DATA                 COPY public.buying_service (object_id, userid, orderid, buying_price, buying_service_state, ship_price, box_actual_weight, box_volume_weight, tracking_company_kor, tracking_company_world, trackingnr_kor, trackingnr_world, shop_url, order_date, product_list_total_price) FROM stdin;
    public       postgres    false    219   ��       �          0    24951    buying_service_payment 
   TABLE DATA               )  COPY public.buying_service_payment (object_id, buying_deposit_payment, shipping_deposit_payment, buying_payment_date, shipping_payment_date, buying_deposit_ownername, shipping_deposit_ownername, payment_art, buying_service_payment_state, fk_buying_service, payment_art_shipping_price) FROM stdin;
    public       postgres    false    223   (�       �          0    24983    buying_service_product 
   TABLE DATA               �   COPY public.buying_service_product (object_id, pd_categorytitle, pd_itemtitle, pd_brandname, pd_itemname, pd_amount, pd_price, pd_totalprice, fk_buying_service) FROM stdin;
    public       postgres    false    225   `�       �          0    24935    buying_service_recipient 
   TABLE DATA               �   COPY public.buying_service_recipient (object_id, name_kor, name_eng, transit_nr, phonenumber_first, phonenumber_second, zip_code, address, usercomment, fk_buying_service) FROM stdin;
    public       postgres    false    221   ��       �          0    24804    customer 
   TABLE DATA               �   COPY public.customer (id, userid, name_kor, name_eng, email, transit_nr, phonenumber_first, phonenumber_second, zip_code, address) FROM stdin;
    public       postgres    false    211   ;�       �          0    16402    customerstatus 
   TABLE DATA               c   COPY public.customerstatus (id, gkoo_id, insuranceamount, depositeamount, pointamount) FROM stdin;
    public       postgres    false    196   Ǡ       �          0    16612    favorite_address 
   TABLE DATA               �   COPY public.favorite_address (id, userid, name_kor, name_eng, transit_nr, phonenumber_first, phonenumber_second, zip_code, address) FROM stdin;
    public       postgres    false    209   �       �          0    24870    notices 
   TABLE DATA               V   COPY public.notices (noticeid, notice_title, notice_content, notice_date) FROM stdin;
    public       postgres    false    215   ݡ       �          0    16416 
   orderstate 
   TABLE DATA               �   COPY public.orderstate (id, userid, orderid, ship_price, ship_state, trackingnr_kor, trackingnr_world, box_actual_weight, box_volume_weight, ship_price_discount, tracking_company_kor, tracking_company_world, shop_url, order_date) FROM stdin;
    public       postgres    false    198   X�       �          0    16424    payment 
   TABLE DATA               �   COPY public.payment (paymentid, userid, orderid, payment_date, payment_ownername, payment_art, payment_deposit, payment_state, fk_orderstate) FROM stdin;
    public       postgres    false    200   �       �          0    16432    product 
   TABLE DATA               �   COPY public.product (id, memberid, orderid, order_stamp, pd_categorytitle, pd_itemtitle, pd_brandname, pd_itemname, pd_amount, pd_price, pd_totalprice) FROM stdin;
    public       postgres    false    202   ٣       �          0    16440    purchaseorder 
   TABLE DATA               �   COPY public.purchaseorder (id, gkooid, productname, productimageurl, productprice, servicefee, totalprice, delieverstatus) FROM stdin;
    public       postgres    false    204   �       �          0    24881    question_answer 
   TABLE DATA               �   COPY public.question_answer (qnaid, question_title, question_content, question_date, answer_content, answer_state, answer_date, userid) FROM stdin;
    public       postgres    false    217   ��       �          0    24837 	   recipient 
   TABLE DATA               �   COPY public.recipient (id, userid, orderid, name_kor, name_eng, transit_nr, phonenumber_first, phonenumber_second, zip_code, address, usercomment) FROM stdin;
    public       postgres    false    213   ��       �          0    16456 
   settlement 
   TABLE DATA               �   COPY public.settlement (settlement_date, item_id, "transactionMoney", "depositMoney", item_name, "itemFotoUrl", "purchasePrice", "shippingPrice", "settleAmount", id) FROM stdin;
    public       postgres    false    206   �       �           0    0    buying_service_object_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.buying_service_object_id_seq', 14, true);
            public       postgres    false    218            �           0    0 $   buying_service_payment_object_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.buying_service_payment_object_id_seq', 13, true);
            public       postgres    false    222            �           0    0 $   buying_service_product_object_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.buying_service_product_object_id_seq', 6, true);
            public       postgres    false    224            �           0    0 &   buying_service_recipient_object_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.buying_service_recipient_object_id_seq', 11, true);
            public       postgres    false    220            �           0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 1, true);
            public       postgres    false    210            �           0    0    customerstatus_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.customerstatus_id_seq', 156, true);
            public       postgres    false    197            �           0    0    favorite_address_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorite_address_id_seq', 14, true);
            public       postgres    false    208            �           0    0    notices_noticeid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.notices_noticeid_seq', 1, true);
            public       postgres    false    214            �           0    0    orderstate_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.orderstate_id_seq', 27, true);
            public       postgres    false    199            �           0    0    payment_paymentid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_paymentid_seq', 21, true);
            public       postgres    false    201            �           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 80, true);
            public       postgres    false    203            �           0    0    purchaseorder_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.purchaseorder_id_seq', 1, false);
            public       postgres    false    205            �           0    0    question_answer_qnaid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.question_answer_qnaid_seq', 5, true);
            public       postgres    false    216            �           0    0    recipient_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.recipient_id_seq', 14, true);
            public       postgres    false    212            �           0    0    settlement_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.settlement_id_seq', 2, true);
            public       postgres    false    207                       2606    24959 2   buying_service_payment buying_service_payment_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.buying_service_payment
    ADD CONSTRAINT buying_service_payment_pkey PRIMARY KEY (object_id);
 \   ALTER TABLE ONLY public.buying_service_payment DROP CONSTRAINT buying_service_payment_pkey;
       public         postgres    false    223            	           2606    24900 "   buying_service buying_service_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.buying_service
    ADD CONSTRAINT buying_service_pkey PRIMARY KEY (object_id);
 L   ALTER TABLE ONLY public.buying_service DROP CONSTRAINT buying_service_pkey;
       public         postgres    false    219                       2606    24991 2   buying_service_product buying_service_product_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.buying_service_product
    ADD CONSTRAINT buying_service_product_pkey PRIMARY KEY (object_id);
 \   ALTER TABLE ONLY public.buying_service_product DROP CONSTRAINT buying_service_product_pkey;
       public         postgres    false    225                       2606    24943 6   buying_service_recipient buying_service_recipient_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.buying_service_recipient
    ADD CONSTRAINT buying_service_recipient_pkey PRIMARY KEY (object_id);
 `   ALTER TABLE ONLY public.buying_service_recipient DROP CONSTRAINT buying_service_recipient_pkey;
       public         postgres    false    221                       2606    24812    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public         postgres    false    211            �
           2606    16475 "   customerstatus customerstatus_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customerstatus
    ADD CONSTRAINT customerstatus_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.customerstatus DROP CONSTRAINT customerstatus_pkey;
       public         postgres    false    196            �
           2606    16620 &   favorite_address favorite_address_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.favorite_address
    ADD CONSTRAINT favorite_address_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.favorite_address DROP CONSTRAINT favorite_address_pkey;
       public         postgres    false    209                       2606    24878    notices notices_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.notices
    ADD CONSTRAINT notices_pkey PRIMARY KEY (noticeid);
 >   ALTER TABLE ONLY public.notices DROP CONSTRAINT notices_pkey;
       public         postgres    false    215            �
           2606    16479    orderstate orderstate_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.orderstate
    ADD CONSTRAINT orderstate_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.orderstate DROP CONSTRAINT orderstate_pkey;
       public         postgres    false    198            �
           2606    16481    payment payment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public         postgres    false    200            �
           2606    16483    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    202            �
           2606    16485     purchaseorder purchaseorder_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT purchaseorder_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT purchaseorder_pkey;
       public         postgres    false    204                       2606    24889 $   question_answer question_answer_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.question_answer
    ADD CONSTRAINT question_answer_pkey PRIMARY KEY (qnaid);
 N   ALTER TABLE ONLY public.question_answer DROP CONSTRAINT question_answer_pkey;
       public         postgres    false    217                       2606    24845    recipient recipient_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.recipient
    ADD CONSTRAINT recipient_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.recipient DROP CONSTRAINT recipient_pkey;
       public         postgres    false    213            �
           2606    16489    settlement settlement_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.settlement
    ADD CONSTRAINT settlement_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.settlement DROP CONSTRAINT settlement_pkey;
       public         postgres    false    206                       2606    24960 D   buying_service_payment buying_service_payment_fk_buying_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.buying_service_payment
    ADD CONSTRAINT buying_service_payment_fk_buying_service_fkey FOREIGN KEY (fk_buying_service) REFERENCES public.buying_service(object_id);
 n   ALTER TABLE ONLY public.buying_service_payment DROP CONSTRAINT buying_service_payment_fk_buying_service_fkey;
       public       postgres    false    2825    223    219                       2606    24992 D   buying_service_product buying_service_product_fk_buying_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.buying_service_product
    ADD CONSTRAINT buying_service_product_fk_buying_service_fkey FOREIGN KEY (fk_buying_service) REFERENCES public.buying_service(object_id);
 n   ALTER TABLE ONLY public.buying_service_product DROP CONSTRAINT buying_service_product_fk_buying_service_fkey;
       public       postgres    false    219    225    2825                       2606    24944 H   buying_service_recipient buying_service_recipient_fk_buying_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.buying_service_recipient
    ADD CONSTRAINT buying_service_recipient_fk_buying_service_fkey FOREIGN KEY (fk_buying_service) REFERENCES public.buying_service(object_id);
 r   ALTER TABLE ONLY public.buying_service_recipient DROP CONSTRAINT buying_service_recipient_fk_buying_service_fkey;
       public       postgres    false    219    2825    221                       2606    24847 "   payment payment_fk_orderstate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_fk_orderstate_fkey FOREIGN KEY (fk_orderstate) REFERENCES public.orderstate(id);
 L   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_fk_orderstate_fkey;
       public       postgres    false    2805    198    200            �   x   x�34���42020024105�01�44310�4�445 ��@V��ް�M��77��գ�f����3_m��zÜ7K&�������u�����r��ļ��<��T��F��&���\1z\\\ �5*�      �   (   x�34��C�77�in|;��e�i�ih�i����� �=�      �   1   x�3�|���ͼ	o�y;���͌%��L��I�����d����� �      �   �   x� ��11	조상훈	Sanghun Cho	DE12345678	010.5460.8998		704157	대구광역시 달서구 내당1동 다기정	빨리보내!	14
\.


9\9�      �   |   x�3���|�pÛ�Ʒ�;8���3J��3�9c�8]\��ML��-8�LM��,,--@r�&��术{^m]�j��7�׾鞣�{͛�9@!��M[^w�4|�?(��ՎoL����� :�1�      �   .   x�3���4 BC.��Ҽ���<����)�CS3dn� �a      �   �   x�3���|�pÛ�Ʒ�;8�K���3�9]\�-,ML��8t-L̀����gnhl�khhi�iabhan�������5��L|3}��9
��׼i�R �f�7�6�ް���o�ny�c��%���y��yP��������3Z��8������ln`bhj�ǩ������i��&Ppɫ�,��ehBG�b���� lܨ!      �   k   x�3�t���Wx���k�ۮ
��ox�s-��޴-|���vZ����
���y�|	T�M��7�־��I��-@�7K&�������u�N##]C]CC�=... ��<c      �   �   x�}�M
�0�ur����L��+�OЍ�T���^�D��B2	y���N�@�D*q��9����k���P@40��,��J���̌�xJ�i��`�C7i\�հ[(����Y��0{!�m+>Tn���.hE*(K	�IY��I��W+�<3.�;#�u��ǻ7��*B7Fk�!�WH      �   �   x�m�1�@�z�^ 3������Jc���hC���%^��;�DHL����35�%DT�	bM����Ȳ�v�5�+�B|4��~����_xі���ܵ$�
��5��10��|v����;k<�@�Ӧ85��@�Q��X�S}L�5�P����y�g�p:g�7j�M�      �   *  x���;n�@���)t-ffwfwy��!�d	�`G,�7b F�"b�E�)R�ʍD�!��->:$a����ټ3��I�����1�d��D(�-:1���������d�X���t~fЈ�*��"��c��'4��u�p[=~{���T_�o���n����t�:5���l^s��LF@� dGF#�0��K�S<Ğ�)�B�s��kxn�\b,=� Id8=�,gh��=;\�s	Jr6%�膹](5P!Bq�@e�5E)]��1R4�O_�?�����L���yy_�kcE-B�J�96�xm��M���ey�\R��-\�/�.ԖD�0�j��^N
�.���5O�Q�!@��y���FJ�]VX��������ĖƉ�3u�����i���v��dq�Xo�3�3��}�D���6ee���b1��B,�s�9Y�7��iFM�ҀOpȱ{*!Zc$�+ )+=krvytajI�/8ty��I	`�GyM퓥����(3���_&��=��3u��y��S���;);i�u#��u;��B�ɒ�B?��[�h�����U~�䣓vu����P���.G��������6�:�+ѷ��ʫM�	��'�����6:�gesX+�/p��j���E�ԣ�т���6�I��d��B���J�,9	B�e�&]��Q�zD�����a	�l�C�*$�T[�N�d֔�BF粤.'�.�p�&l:~%�NleF
��4�iZ�]�(���:���D��]#�A!J��:6Q�q������2�?�C�lr�tC��E��ƀ      �   �   x�3�442�I�IM+��N�S�I,-).(JM�H-Rp+����440100�44��� �u뛹{^o��m�%����r�������y��)�8���:{�)�f�(x�'g�ޖ4��d�H30�v�W[��M����� X�6�      �   �   x�3�|�������{^wo�4202�50�54���rut���w�w	�rq�ް�M��7s�(����͂9
�'�x�4�ͬ)�o�m	�Y�h�۩@�5{�N�x3���͌%o/�'�"c�E@��̝�a+	&�p�ں���%@O��֩ 5*�t���N��k��� _a�)�=0�-1z\\\ ;�      �   q  x��R�JCA�g���@.�s�JQ{��&H@�@$���B���P��!`������̓��eva�3gϜ	U �NiLQb~�	���`�ѬF��	��KJR���DZ9^|3Z+��P�J%����w2�����?~���Y]��%#�k�J���:�`��H@���W&�J���Z��0��2x��@�:�n��<��m��)��m i��Bx���ߧ�ECѬ�U�b�Bb���V�κB�-TZ�-��~hu9�����_��Oh��ㇰK!�4
��V�JY���HDښ���@H���dm��ɥ+L�.(�j�<�RL�2�fw}{,��'�&�Ax�09�����wLZ٘x�(e��B�?#Q�      �   �   x�320��54�50�442�4�444260�I�IM+��N�S�I,-).(JM�H-Rp+���44�4 �j000����fU�"I�������y��)�8���:{�)�f�(x�'g�ޖ�Z�df
1��l�W� '�     