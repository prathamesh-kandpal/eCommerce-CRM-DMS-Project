PGDMP      #                |            ecommerce_data_lake    17.2    17.2 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    19356    ecommerce_data_lake    DATABASE     �   CREATE DATABASE ecommerce_data_lake WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 #   DROP DATABASE ecommerce_data_lake;
                     postgres    false            �            1255    19635    update_inventory()    FUNCTION     �   CREATE FUNCTION public.update_inventory() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE products
    SET inventory_count = inventory_count - NEW.quantity
    WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.update_inventory();
       public               postgres    false            �            1259    19521    competitor_pricing    TABLE     �   CREATE TABLE public.competitor_pricing (
    competitor_id integer NOT NULL,
    product_name character varying(100),
    competitor_name character varying(100),
    price numeric(10,2),
    collected_date date
);
 &   DROP TABLE public.competitor_pricing;
       public         heap r       postgres    false            �            1259    19520 $   competitor_pricing_competitor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.competitor_pricing_competitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.competitor_pricing_competitor_id_seq;
       public               postgres    false    226            �           0    0 $   competitor_pricing_competitor_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.competitor_pricing_competitor_id_seq OWNED BY public.competitor_pricing.competitor_id;
          public               postgres    false    225            �            1259    19493    customer_reviews    TABLE     �   CREATE TABLE public.customer_reviews (
    review_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    review_text text,
    review_date date
);
 $   DROP TABLE public.customer_reviews;
       public         heap r       postgres    false            �            1259    19492    customer_reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.customer_reviews_review_id_seq;
       public               postgres    false    222            �           0    0    customer_reviews_review_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.customer_reviews_review_id_seq OWNED BY public.customer_reviews.review_id;
          public               postgres    false    221            �            1259    19448 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(15),
    date_joined date,
    lifetime_value numeric(10,2)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false            �            1259    19447    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public               postgres    false    218            �           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public               postgres    false    217            �            1259    19547    data_ingestion_logs    TABLE     �   CREATE TABLE public.data_ingestion_logs (
    log_id integer NOT NULL,
    ingestion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    table_name character varying(50),
    rows_inserted integer,
    status character varying(50)
);
 '   DROP TABLE public.data_ingestion_logs;
       public         heap r       postgres    false            �            1259    19546    data_ingestion_logs_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_ingestion_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.data_ingestion_logs_log_id_seq;
       public               postgres    false    230            �           0    0    data_ingestion_logs_log_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.data_ingestion_logs_log_id_seq OWNED BY public.data_ingestion_logs.log_id;
          public               postgres    false    229            �            1259    19555    external_data_sources    TABLE     �   CREATE TABLE public.external_data_sources (
    source_id integer NOT NULL,
    source_name character varying(100),
    data_type character varying(50),
    last_updated timestamp without time zone
);
 )   DROP TABLE public.external_data_sources;
       public         heap r       postgres    false            �            1259    19554 #   external_data_sources_source_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_data_sources_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.external_data_sources_source_id_seq;
       public               postgres    false    232            �           0    0 #   external_data_sources_source_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.external_data_sources_source_id_seq OWNED BY public.external_data_sources.source_id;
          public               postgres    false    231            �            1259    19637    external_pricing_staging    TABLE     �   CREATE TABLE public.external_pricing_staging (
    product_name character varying(100),
    competitor_name character varying(100),
    price numeric(10,2),
    collected_date date
);
 ,   DROP TABLE public.external_pricing_staging;
       public         heap r       postgres    false            �            1259    19528    market_trends    TABLE     �   CREATE TABLE public.market_trends (
    trend_id integer NOT NULL,
    category character varying(50),
    trend_description text,
    collected_date date
);
 !   DROP TABLE public.market_trends;
       public         heap r       postgres    false            �            1259    19527    market_trends_trend_id_seq    SEQUENCE     �   CREATE SEQUENCE public.market_trends_trend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.market_trends_trend_id_seq;
       public               postgres    false    228            �           0    0    market_trends_trend_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.market_trends_trend_id_seq OWNED BY public.market_trends.trend_id;
          public               postgres    false    227            �            1259    19512    marketing_logs    TABLE     �   CREATE TABLE public.marketing_logs (
    log_id integer NOT NULL,
    log_date date,
    channel character varying(50),
    message text,
    response_rate numeric(5,2)
);
 "   DROP TABLE public.marketing_logs;
       public         heap r       postgres    false            �            1259    19511    marketing_logs_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marketing_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.marketing_logs_log_id_seq;
       public               postgres    false    224            �           0    0    marketing_logs_log_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.marketing_logs_log_id_seq OWNED BY public.marketing_logs.log_id;
          public               postgres    false    223            �            1259    19583    orders    TABLE     )  CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_date date NOT NULL,
    total_amount numeric(10,2),
    status character varying(50),
    CONSTRAINT check_total_amount CHECK ((total_amount > (0)::numeric))
)
PARTITION BY RANGE (order_date);
    DROP TABLE public.orders;
       public         p       postgres    false            �            1259    19677    monthly_sales_summary    MATERIALIZED VIEW     '  CREATE MATERIALIZED VIEW public.monthly_sales_summary AS
 SELECT date_trunc('month'::text, (order_date)::timestamp with time zone) AS month,
    sum(total_amount) AS total_sales
   FROM public.orders
  GROUP BY (date_trunc('month'::text, (order_date)::timestamp with time zone))
  WITH NO DATA;
 5   DROP MATERIALIZED VIEW public.monthly_sales_summary;
       public         heap m       postgres    false    234    234            �            1259    19602    order_items    TABLE     �   CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.order_items;
       public         heap r       postgres    false            �            1259    19601    order_items_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.order_items_order_item_id_seq;
       public               postgres    false    236            �           0    0    order_items_order_item_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;
          public               postgres    false    235            �            1259    19582    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public               postgres    false    234            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public               postgres    false    233            �            1259    19622    orders_2023    TABLE     F  CREATE TABLE public.orders_2023 (
    order_id integer DEFAULT nextval('public.orders_order_id_seq'::regclass) NOT NULL,
    customer_id integer NOT NULL,
    order_date date NOT NULL,
    total_amount numeric(10,2),
    status character varying(50),
    CONSTRAINT check_total_amount CHECK ((total_amount > (0)::numeric))
);
    DROP TABLE public.orders_2023;
       public         heap r       postgres    false    233    234            �            1259    19613    orders_2024    TABLE     F  CREATE TABLE public.orders_2024 (
    order_id integer DEFAULT nextval('public.orders_order_id_seq'::regclass) NOT NULL,
    customer_id integer NOT NULL,
    order_date date NOT NULL,
    total_amount numeric(10,2),
    status character varying(50),
    CONSTRAINT check_total_amount CHECK ((total_amount > (0)::numeric))
);
    DROP TABLE public.orders_2024;
       public         heap r       postgres    false    233    234            �            1259    19457    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(100),
    category character varying(50),
    price numeric(10,2),
    inventory_count integer
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    19456    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public               postgres    false    220            �           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public               postgres    false    219            �            1259    19640    sales_summary    TABLE     X   CREATE TABLE public.sales_summary (
    customer_id integer,
    total_spent numeric
);
 !   DROP TABLE public.sales_summary;
       public         heap r       postgres    false            �           0    0    orders_2023    TABLE ATTACH     u   ALTER TABLE ONLY public.orders ATTACH PARTITION public.orders_2023 FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
          public               postgres    false    238    234            �           0    0    orders_2024    TABLE ATTACH     u   ALTER TABLE ONLY public.orders ATTACH PARTITION public.orders_2024 FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
          public               postgres    false    237    234            �           2604    19524     competitor_pricing competitor_id    DEFAULT     �   ALTER TABLE ONLY public.competitor_pricing ALTER COLUMN competitor_id SET DEFAULT nextval('public.competitor_pricing_competitor_id_seq'::regclass);
 O   ALTER TABLE public.competitor_pricing ALTER COLUMN competitor_id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    19496    customer_reviews review_id    DEFAULT     �   ALTER TABLE ONLY public.customer_reviews ALTER COLUMN review_id SET DEFAULT nextval('public.customer_reviews_review_id_seq'::regclass);
 I   ALTER TABLE public.customer_reviews ALTER COLUMN review_id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    19451    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    19550    data_ingestion_logs log_id    DEFAULT     �   ALTER TABLE ONLY public.data_ingestion_logs ALTER COLUMN log_id SET DEFAULT nextval('public.data_ingestion_logs_log_id_seq'::regclass);
 I   ALTER TABLE public.data_ingestion_logs ALTER COLUMN log_id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    19558    external_data_sources source_id    DEFAULT     �   ALTER TABLE ONLY public.external_data_sources ALTER COLUMN source_id SET DEFAULT nextval('public.external_data_sources_source_id_seq'::regclass);
 N   ALTER TABLE public.external_data_sources ALTER COLUMN source_id DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    19531    market_trends trend_id    DEFAULT     �   ALTER TABLE ONLY public.market_trends ALTER COLUMN trend_id SET DEFAULT nextval('public.market_trends_trend_id_seq'::regclass);
 E   ALTER TABLE public.market_trends ALTER COLUMN trend_id DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    19515    marketing_logs log_id    DEFAULT     ~   ALTER TABLE ONLY public.marketing_logs ALTER COLUMN log_id SET DEFAULT nextval('public.marketing_logs_log_id_seq'::regclass);
 D   ALTER TABLE public.marketing_logs ALTER COLUMN log_id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    19605    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    19586    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    234    233    234            �           2604    19460    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public               postgres    false    219    220    220            w          0    19521    competitor_pricing 
   TABLE DATA           q   COPY public.competitor_pricing (competitor_id, product_name, competitor_name, price, collected_date) FROM stdin;
    public               postgres    false    226   ��       s          0    19493    customer_reviews 
   TABLE DATA           h   COPY public.customer_reviews (review_id, customer_id, product_id, review_text, review_date) FROM stdin;
    public               postgres    false    222   �       o          0    19448 	   customers 
   TABLE DATA           a   COPY public.customers (customer_id, name, email, phone, date_joined, lifetime_value) FROM stdin;
    public               postgres    false    218   l�       {          0    19547    data_ingestion_logs 
   TABLE DATA           h   COPY public.data_ingestion_logs (log_id, ingestion_date, table_name, rows_inserted, status) FROM stdin;
    public               postgres    false    230   �       }          0    19555    external_data_sources 
   TABLE DATA           `   COPY public.external_data_sources (source_id, source_name, data_type, last_updated) FROM stdin;
    public               postgres    false    232   �       �          0    19637    external_pricing_staging 
   TABLE DATA           h   COPY public.external_pricing_staging (product_name, competitor_name, price, collected_date) FROM stdin;
    public               postgres    false    239   $�       y          0    19528    market_trends 
   TABLE DATA           ^   COPY public.market_trends (trend_id, category, trend_description, collected_date) FROM stdin;
    public               postgres    false    228   A�       u          0    19512    marketing_logs 
   TABLE DATA           [   COPY public.marketing_logs (log_id, log_date, channel, message, response_rate) FROM stdin;
    public               postgres    false    224   ��       �          0    19602    order_items 
   TABLE DATA           [   COPY public.order_items (order_item_id, order_id, product_id, quantity, price) FROM stdin;
    public               postgres    false    236   ��       �          0    19622    orders_2023 
   TABLE DATA           ^   COPY public.orders_2023 (order_id, customer_id, order_date, total_amount, status) FROM stdin;
    public               postgres    false    238   �       �          0    19613    orders_2024 
   TABLE DATA           ^   COPY public.orders_2024 (order_id, customer_id, order_date, total_amount, status) FROM stdin;
    public               postgres    false    237   l�       q          0    19457    products 
   TABLE DATA           V   COPY public.products (product_id, name, category, price, inventory_count) FROM stdin;
    public               postgres    false    220   �       �          0    19640    sales_summary 
   TABLE DATA           A   COPY public.sales_summary (customer_id, total_spent) FROM stdin;
    public               postgres    false    240   ��       �           0    0 $   competitor_pricing_competitor_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.competitor_pricing_competitor_id_seq', 22, true);
          public               postgres    false    225            �           0    0    customer_reviews_review_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.customer_reviews_review_id_seq', 22, true);
          public               postgres    false    221            �           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 10, true);
          public               postgres    false    217            �           0    0    data_ingestion_logs_log_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.data_ingestion_logs_log_id_seq', 1, false);
          public               postgres    false    229            �           0    0 #   external_data_sources_source_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.external_data_sources_source_id_seq', 1, false);
          public               postgres    false    231            �           0    0    market_trends_trend_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.market_trends_trend_id_seq', 22, true);
          public               postgres    false    227            �           0    0    marketing_logs_log_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.marketing_logs_log_id_seq', 11, true);
          public               postgres    false    223            �           0    0    order_items_order_item_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 10, true);
          public               postgres    false    235            �           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 11, true);
          public               postgres    false    233            �           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 10, true);
          public               postgres    false    219            �           2606    19526 *   competitor_pricing competitor_pricing_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.competitor_pricing
    ADD CONSTRAINT competitor_pricing_pkey PRIMARY KEY (competitor_id);
 T   ALTER TABLE ONLY public.competitor_pricing DROP CONSTRAINT competitor_pricing_pkey;
       public                 postgres    false    226            �           2606    19500 &   customer_reviews customer_reviews_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.customer_reviews
    ADD CONSTRAINT customer_reviews_pkey PRIMARY KEY (review_id);
 P   ALTER TABLE ONLY public.customer_reviews DROP CONSTRAINT customer_reviews_pkey;
       public                 postgres    false    222            �           2606    19455    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public                 postgres    false    218            �           2606    19453    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    218            �           2606    19553 ,   data_ingestion_logs data_ingestion_logs_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.data_ingestion_logs
    ADD CONSTRAINT data_ingestion_logs_pkey PRIMARY KEY (log_id);
 V   ALTER TABLE ONLY public.data_ingestion_logs DROP CONSTRAINT data_ingestion_logs_pkey;
       public                 postgres    false    230            �           2606    19560 0   external_data_sources external_data_sources_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.external_data_sources
    ADD CONSTRAINT external_data_sources_pkey PRIMARY KEY (source_id);
 Z   ALTER TABLE ONLY public.external_data_sources DROP CONSTRAINT external_data_sources_pkey;
       public                 postgres    false    232            �           2606    19535     market_trends market_trends_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.market_trends
    ADD CONSTRAINT market_trends_pkey PRIMARY KEY (trend_id);
 J   ALTER TABLE ONLY public.market_trends DROP CONSTRAINT market_trends_pkey;
       public                 postgres    false    228            �           2606    19519 "   marketing_logs marketing_logs_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.marketing_logs
    ADD CONSTRAINT marketing_logs_pkey PRIMARY KEY (log_id);
 L   ALTER TABLE ONLY public.marketing_logs DROP CONSTRAINT marketing_logs_pkey;
       public                 postgres    false    224            �           2606    19607    order_items order_items_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public                 postgres    false    236            �           2606    19588    orders orders_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (order_id, order_date);
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pk;
       public                 postgres    false    234    234            �           2606    19627    orders_2023 orders_2023_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.orders_2023
    ADD CONSTRAINT orders_2023_pkey PRIMARY KEY (order_id, order_date);
 F   ALTER TABLE ONLY public.orders_2023 DROP CONSTRAINT orders_2023_pkey;
       public                 postgres    false    238    238    4801    238            �           2606    19618    orders_2024 orders_2024_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.orders_2024
    ADD CONSTRAINT orders_2024_pkey PRIMARY KEY (order_id, order_date);
 F   ALTER TABLE ONLY public.orders_2024 DROP CONSTRAINT orders_2024_pkey;
       public                 postgres    false    237    4801    237    237            �           2606    19462    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    220            �           1259    19645    idx_customer_id    INDEX     N   CREATE INDEX idx_customer_id ON ONLY public.orders USING btree (customer_id);
 #   DROP INDEX public.idx_customer_id;
       public                 postgres    false    234            �           1259    19652    idx_order_date    INDEX     L   CREATE INDEX idx_order_date ON ONLY public.orders USING btree (order_date);
 "   DROP INDEX public.idx_order_date;
       public                 postgres    false    234            �           1259    19648    idx_order_date_status    INDEX     [   CREATE INDEX idx_order_date_status ON ONLY public.orders USING btree (order_date, status);
 )   DROP INDEX public.idx_order_date_status;
       public                 postgres    false    234    234            �           1259    19651    idx_product_id    INDEX     L   CREATE INDEX idx_product_id ON public.order_items USING btree (product_id);
 "   DROP INDEX public.idx_product_id;
       public                 postgres    false    236            �           1259    19646    orders_2023_customer_id_idx    INDEX     Z   CREATE INDEX orders_2023_customer_id_idx ON public.orders_2023 USING btree (customer_id);
 /   DROP INDEX public.orders_2023_customer_id_idx;
       public                 postgres    false    238    238    4797            �           1259    19653    orders_2023_order_date_idx    INDEX     �   CREATE INDEX orders_2023_order_date_idx ON public.orders_2023 USING btree (order_date);

ALTER TABLE public.orders_2023 CLUSTER ON orders_2023_order_date_idx;
 .   DROP INDEX public.orders_2023_order_date_idx;
       public                 postgres    false    4798    238    238            �           1259    19649 !   orders_2023_order_date_status_idx    INDEX     g   CREATE INDEX orders_2023_order_date_status_idx ON public.orders_2023 USING btree (order_date, status);
 5   DROP INDEX public.orders_2023_order_date_status_idx;
       public                 postgres    false    238    4799    238    238            �           1259    19647    orders_2024_customer_id_idx    INDEX     Z   CREATE INDEX orders_2024_customer_id_idx ON public.orders_2024 USING btree (customer_id);
 /   DROP INDEX public.orders_2024_customer_id_idx;
       public                 postgres    false    237    237    4797            �           1259    19654    orders_2024_order_date_idx    INDEX     �   CREATE INDEX orders_2024_order_date_idx ON public.orders_2024 USING btree (order_date);

ALTER TABLE public.orders_2024 CLUSTER ON orders_2024_order_date_idx;
 .   DROP INDEX public.orders_2024_order_date_idx;
       public                 postgres    false    237    237    4798            �           1259    19650 !   orders_2024_order_date_status_idx    INDEX     g   CREATE INDEX orders_2024_order_date_status_idx ON public.orders_2024 USING btree (order_date, status);
 5   DROP INDEX public.orders_2024_order_date_status_idx;
       public                 postgres    false    237    237    4799    237            �           0    0    orders_2023_customer_id_idx    INDEX ATTACH     X   ALTER INDEX public.idx_customer_id ATTACH PARTITION public.orders_2023_customer_id_idx;
          public               postgres    false    4810    4797    238    234            �           0    0    orders_2023_order_date_idx    INDEX ATTACH     V   ALTER INDEX public.idx_order_date ATTACH PARTITION public.orders_2023_order_date_idx;
          public               postgres    false    4811    4798    238    234            �           0    0 !   orders_2023_order_date_status_idx    INDEX ATTACH     d   ALTER INDEX public.idx_order_date_status ATTACH PARTITION public.orders_2023_order_date_status_idx;
          public               postgres    false    4812    4799    238    234            �           0    0    orders_2023_pkey    INDEX ATTACH     G   ALTER INDEX public.orders_pk ATTACH PARTITION public.orders_2023_pkey;
          public               postgres    false    4814    238    4801    4801    238    234            �           0    0    orders_2024_customer_id_idx    INDEX ATTACH     X   ALTER INDEX public.idx_customer_id ATTACH PARTITION public.orders_2024_customer_id_idx;
          public               postgres    false    4805    4797    237    234            �           0    0    orders_2024_order_date_idx    INDEX ATTACH     V   ALTER INDEX public.idx_order_date ATTACH PARTITION public.orders_2024_order_date_idx;
          public               postgres    false    4806    4798    237    234            �           0    0 !   orders_2024_order_date_status_idx    INDEX ATTACH     d   ALTER INDEX public.idx_order_date_status ATTACH PARTITION public.orders_2024_order_date_status_idx;
          public               postgres    false    4807    4799    237    234            �           0    0    orders_2024_pkey    INDEX ATTACH     G   ALTER INDEX public.orders_pk ATTACH PARTITION public.orders_2024_pkey;
          public               postgres    false    237    4809    4801    4801    237    234            �           2620    19636    order_items after_order_insert    TRIGGER     ~   CREATE TRIGGER after_order_insert AFTER INSERT ON public.order_items FOR EACH ROW EXECUTE FUNCTION public.update_inventory();
 7   DROP TRIGGER after_order_insert ON public.order_items;
       public               postgres    false    242    236            �           2606    19501 2   customer_reviews customer_reviews_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_reviews
    ADD CONSTRAINT customer_reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 \   ALTER TABLE ONLY public.customer_reviews DROP CONSTRAINT customer_reviews_customer_id_fkey;
       public               postgres    false    222    218    4782            �           2606    19506 1   customer_reviews customer_reviews_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_reviews
    ADD CONSTRAINT customer_reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 [   ALTER TABLE ONLY public.customer_reviews DROP CONSTRAINT customer_reviews_product_id_fkey;
       public               postgres    false    220    4784    222            �           2606    19589    orders fk_customer    FK CONSTRAINT     }   ALTER TABLE public.orders
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 7   ALTER TABLE public.orders DROP CONSTRAINT fk_customer;
       public               postgres    false    218    234    4782            �           2606    19608    order_items fk_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 @   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_product;
       public               postgres    false    236    4784    220            �           0    19677    monthly_sales_summary    MATERIALIZED VIEW DATA     8   REFRESH MATERIALIZED VIEW public.monthly_sales_summary;
          public               postgres    false    241    4999            w   )  x���AN�0E�3��Ry�8I�4-PVEbӍ��H��q��㔍�J$/�|͟'�`� ��e�Mt�2�b8�i̒�r��<�����X�F8v��+�%�E����K���m���$P�^vM���u�� 	s9��g�Oi_k��
���J�)#}n��L�^lڋ�Z�::J�+�T@�\���*��6��9G[�|��A&�wb��ժq��e�{HC^ �\��@"Ͷ�j�<���"�S��"]��W�Le'.|����,q����<@�Խ9�C��,���i���tv      s   t  x�}��n�0���S��6��&M��Pv�]vQd�"K�$'͞~���N�4rpL���O���x�X�'���'�UL�\�Q;���\��w�՝\���x���������I�[��;� _{t���*8��BjM�ة���;��f��S)�k�)��N.�}��L����^]5��ߒʥXO��E��Q�qh���FO���mSp����J��n��ɚ؎�ԃ��x��%w��<�U�:
�&��-� 4m����@�Ķ��lL�Ӈ�G�� G���K�I����ri�ǂ��L#ЪPA�wV�~{[M.���4�?��"Nbh��ї�G�(��ʧN�a3-y.���1��N9}��ļ�a�~!���|�ݫ!��m#dƆw���Z*S+�X�G�L��]�O���Ď5M��ȿ�2Y;�l49^є�4Cf����08���f�(6Hh�4��{{z��"��ϺL�Z����S
������h�d��������t`�)���*l�̘�.�˧�A1:#m:��\R��RƗE��`K�Fz:�����o�E܏F��hiU؊�\_��x��9��h���&F�������L��N>�f�k�k!��7X�      o   n  x�U��n� ���S�F66�5mz��S*�������DMӧ/K,5�8�p��3+��3�/�8�nqO��N_��e��J׍i��@_�E����?M���Gh�ؚ��U��FP��`"�Ѭ��ɏ7NK�eGNw�at��a�B"�*rJd���n���r�a�;�I.�TIi�T�Bh#�i8���|o�}�@��h�e�C'�:�5
�Y/���#:��d2�J�r7H9 e�Hd\�l�Ѯ?�_�b�>�3%Q���P�M�� 3@y:��;��R�v��Iz���@kPԚ����n����e���$�aڤ��ڔN�t-�x���}��[�L6ąȉKr�$��XH#���C0�� ����      {      x������ � �      }      x������ � �      �      x������ � �      y   �  x���An�0E��)x�7�2h� �mR��n��H$,�I������z�#+��ʂE}�������QDo���7�#�L� F��zփ�����ϊ�n.������)n�����;ow�t�Y7��u�3۲������S�`�5Ϋ���ŭ��#h3��ţ�L{u0$5aM�=� ����ӟ��Z��Y�W|U^_�����Ծ�l=.�vp "0���^��,��|������#9dkH?{���z�h$�Yh��Y&:$��yJ����)����eM]^fV����(mN���&�8JJm��*��贵b$�AK�Ȥ�BvQ���hy�����ҝ�<�sH�i�7U�X��>i�n*�����H��#�O���O偈�����v���9��ʐ��s\��h��آ���PV̠���e����CK����֏8�pΒl�f�w.?zZ���p��a����hʐ\�-Q�sjP3iu4)/�W�AC����?��-}1g�_���4��ta��&�Ş��HP�3��I���" N3% �[5�x��x;���.][j��\�*!{�]�gSg���W��0�ҁ�ҁ}�I'��BgU6����'�5���	$��=Jt7Y�t�<ݡ���0�L��te<�FEo0fG�p�yV��?[�a      u   �  x�m����0�k�)���N���r)�w�	t4imk"[I&��Y��?�;��|�JԪެ�z�*�4�u���CDG�G G:?ZK�z��Qo��mɣ�QE�@4��E/d,�W��%x3��!S����RO�)IQ��N�Q)�y���>��jL֏��­�c�D��c���4�V��1�	^���vS��	���Oc��p�����(D)�J*U4�x��,�%ܷuh:�%`�(�'�r	VS�{Y�b��4w���4����N�<}����ܪbw�������l"�Jv�:�n��C�b����!��� �8��4��}`L�-��,��p�V�� ��8,�C6yD�x�]ީ��!K8�\}�����_o��Bs�/�7���z�Jtfˌ:�5��U��)���V��˽��uB�dYK��̨m��ME��W��      �   S   x�5��� @��2���.��^ĆH8���EU*u�H6�Fk%���:SO0X��`2�V\��6���"��?�ED>���      �   Y   x�-�1� D�z�.�Yj�`kc�DT
������J��N
�Q�{k��]
���"���q�a�1�\H�hl��5z{mX��|L�'      �   �   x�]�A
1E׿w鐤Mˬ���֍8Ej���ǨY�@��~�!ɑ8���h"����z{�%$���b��m,븅��8E&�F���ٹ����/��z7�@]P뀪_~���f��8-���z̰�?�~
κ3�S��2�      q   �   x�Uлn�0Й�
A ?�c���R�K�!b��hHL_������,�F���;�\����l���`g���K����X�5\�:���RYl��>=k6���N4�p+���)%(G%
͚c�]�~H�>˪R������"���kU�;x�wV�����1?��ec�����|q�x-�}3<v�$�M��.�K�.��&ŋ�S���Z�D��Rm3      �   D   x�%��� Cѳ=�C��.��"r{��7�4R��LTjH|ҕ����-��g��(������7H�TXT     