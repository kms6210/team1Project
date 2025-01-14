DROP SEQUENCE SEQ_TYPE_NO;
DROP SEQUENCE SEQ_ITEM_NO;
DROP SEQUENCE SEQ_REVIEW_NO;
DROP SEQUENCE SEQ_BID_NO;
DROP SEQUENCE SEQ_ROOM_NO;
DROP SEQUENCE SEQ_USER_USE_NO;
DROP SEQUENCE SEQ_ADMIN_USE_NO;
DROP SEQUENCE SEQ_USER_NO;
DROP SEQUENCE SEQ_CHAT_NO;
DROP SEQUENCE SEQ_PUBLIC_NO;
DROP SEQUENCE SEQ_FAQ_QUESTION_NO;
DROP SEQUENCE SEQ_QNA_QUESTION_NO;
DROP SEQUENCE SEQ_HINT_QUESTION_NO;
DROP SEQUENCE SEQ_STOP_NO;
DROP SEQUENCE SEQ_ADMIN_NO;

DROP TABLE "QNA";
DROP TABLE "LIKELIST";
DROP TABLE "REVIEW";
DROP TABLE "ITEM_TYPE";
DROP TABLE "HINT_TYPE";
DROP TABLE "NOTICE";
DROP TABLE "AUCTION";
DROP TABLE "FAQ";
DROP TABLE "BANNED";
DROP TABLE "USER_ACCOUNT";
DROP TABLE "CHAT_CONTENT";
DROP TABLE "QUALITY";
DROP TABLE "BID";
DROP TABLE "K_ADMIN";
DROP TABLE "ADMIN_ACCOUNT";
DROP TABLE "CHAT_ROOM";
DROP TABLE "ITEM";
DROP TABLE "K_USER";

CREATE SEQUENCE SEQ_TYPE_NO START WITH 100;
CREATE SEQUENCE SEQ_ITEM_NO START WITH 100;
CREATE SEQUENCE SEQ_REVIEW_NO START WITH 100;
CREATE SEQUENCE SEQ_BID_NO START WITH 100;
CREATE SEQUENCE SEQ_ROOM_NO START WITH 100;
CREATE SEQUENCE SEQ_USER_USE_NO START WITH 100;
CREATE SEQUENCE SEQ_ADMIN_USE_NO START WITH 100;
CREATE SEQUENCE SEQ_USER_NO START WITH 100;
CREATE SEQUENCE SEQ_CHAT_NO START WITH 100;
CREATE SEQUENCE SEQ_PUBLIC_NO START WITH 100;
CREATE SEQUENCE SEQ_FAQ_QUESTION_NO START WITH 100;
CREATE SEQUENCE SEQ_QNA_QUESTION_NO START WITH 100;
CREATE SEQUENCE SEQ_HINT_QUESTION_NO START WITH 100;
CREATE SEQUENCE SEQ_STOP_NO START WITH 100;
CREATE SEQUENCE SEQ_ADMIN_NO START WITH 100;

CREATE TABLE "K_USER" (
	"USER_NO"	NUMBER		NOT NULL,
	"ID"	VARCHAR2(20)		NOT NULL,
	"PWD"	VARCHAR2(20)		NOT NULL,
	"NICK"	VARCHAR2(20)		NOT NULL,
	"PHONE_NO"	CHAR(13)		NOT NULL,
	"TRUST_LEVEL"	NUMBER	DEFAULT 36.5	NOT NULL,
	"ADDRESS"	VARCHAR2(4000)		NOT NULL,
	"BALANCE"	NUMBER  DEFAULT 0	NOT	NULL,
	"QUESTION_NO"	NUMBER		NOT NULL,
	"ANSWER"	VARCHAR2(4000)		NOT NULL,
	"USER_STATUS"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SIGN_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "K_USER"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "K_USER"."ID" IS 'ID';

COMMENT ON COLUMN "K_USER"."PWD" IS 'PWD';

COMMENT ON COLUMN "K_USER"."NICK" IS 'NICK';

COMMENT ON COLUMN "K_USER"."PHONE_NO" IS '휴대폰 번호';

COMMENT ON COLUMN "K_USER"."TRUST_LEVEL" IS '신뢰도';

COMMENT ON COLUMN "K_USER"."ADDRESS" IS '주소';

COMMENT ON COLUMN "K_USER"."BALANCE" IS '잔액';

COMMENT ON COLUMN "K_USER"."QUESTION_NO" IS '힌트 질문 번호';

COMMENT ON COLUMN "K_USER"."ANSWER" IS '힌트 답변';

COMMENT ON COLUMN "K_USER"."USER_STATUS" IS '계정 상태';

COMMENT ON COLUMN "K_USER"."SIGN_DATE" IS '가입일';

CREATE TABLE "QNA" (
	"QUESTION_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"QUESTION"	VARCHAR2(4000)		NOT NULL,
	"ANSWER"	VARCHAR2(4000)		NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"WRITE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"ANSWER_DATE"	TIMESTAMP		NULL
);

COMMENT ON COLUMN "QNA"."QUESTION_NO" IS '질문 번호';

COMMENT ON COLUMN "QNA"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "QNA"."QUESTION" IS '질문';

COMMENT ON COLUMN "QNA"."ANSWER" IS '답변';

COMMENT ON COLUMN "QNA"."QUIT_YN" IS '삭제 여부';

COMMENT ON COLUMN "QNA"."WRITE_DATE" IS '작성일';

COMMENT ON COLUMN "QNA"."ANSWER_DATE" IS '답변일';

CREATE TABLE "LIKELIST" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKELIST"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "LIKELIST"."USER_NO" IS '유저 번호';

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL,
	"BUY_REVIEW"	VARCHAR2(4000)		NULL,
	"SELL_REVIEW"	VARCHAR2(4000)		NULL,
	"TRADE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '후기 번호';

COMMENT ON COLUMN "REVIEW"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "REVIEW"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "REVIEW"."BUY_REVIEW" IS '구매 후기';

COMMENT ON COLUMN "REVIEW"."SELL_REVIEW" IS '판매 후기';

COMMENT ON COLUMN "REVIEW"."TRADE_DATE" IS '거래일';

CREATE TABLE "ITEM" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"TYPE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"PRICE"	NUMBER		NOT NULL,
	"VIEW"	NUMBER	DEFAULT 0	NOT NULL,
	"TRADE_STATUS"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"WRITE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "ITEM"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "ITEM"."TYPE_NO" IS '분류 번호';

COMMENT ON COLUMN "ITEM"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "ITEM"."TITLE" IS '제목';

COMMENT ON COLUMN "ITEM"."CONTENT" IS '내용';

COMMENT ON COLUMN "ITEM"."PRICE" IS '가격';

COMMENT ON COLUMN "ITEM"."VIEW" IS '조회수';

COMMENT ON COLUMN "ITEM"."TRADE_STATUS" IS '거래 상태';

COMMENT ON COLUMN "ITEM"."WRITE_DATE" IS '작성 시간';

CREATE TABLE "ITEM_TYPE" (
	"TYPE_NO"	NUMBER		NOT NULL,
	"TYPE_NAME"	VARCHAR(20)		NULL
);

COMMENT ON COLUMN "ITEM_TYPE"."TYPE_NO" IS '분류 번호';

COMMENT ON COLUMN "ITEM_TYPE"."TYPE_NAME" IS '분류 이름';

CREATE TABLE "HINT_TYPE" (
	"QUESTION_NO"	NUMBER		NOT NULL,
	"QUESTION"	VARCHAR2(4000)		NOT NULL
);

COMMENT ON COLUMN "HINT_TYPE"."QUESTION_NO" IS '힌트 질문 번호';

COMMENT ON COLUMN "HINT_TYPE"."QUESTION" IS '질문';

CREATE TABLE "NOTICE" (
	"PUBLIC_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"WRITE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "NOTICE"."PUBLIC_NO" IS '공지 번호';

COMMENT ON COLUMN "NOTICE"."TITLE" IS '제목';

COMMENT ON COLUMN "NOTICE"."CONTENT" IS '내용';

COMMENT ON COLUMN "NOTICE"."QUIT_YN" IS '삭제 여부';

COMMENT ON COLUMN "NOTICE"."WRITE_DATE" IS '작성일';

CREATE TABLE "AUCTION" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"AUCTION_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"END_TIME"	TIMESTAMP		NOT NULL
);

COMMENT ON COLUMN "AUCTION"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "AUCTION"."AUCTION_YN" IS '경매 상태';

COMMENT ON COLUMN "AUCTION"."END_TIME" IS '경매 종료일';

CREATE TABLE "FAQ" (
	"QUESTION_NO"	NUMBER		NOT NULL,
	"QUESTION"	VARCHAR2(4000)		NOT NULL,
	"ANSWER"	VARCHAR2(4000)		NOT NULL
);

COMMENT ON COLUMN "FAQ"."QUESTION_NO" IS '질문 번호';

COMMENT ON COLUMN "FAQ"."QUESTION" IS '질문';

COMMENT ON COLUMN "FAQ"."ANSWER" IS '답변';

CREATE TABLE "BANNED" (
	"STOP_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"STOP_REASON"	VARCHAR2(4000)	DEFAULT '이용 약관 위반'	NOT NULL,
	"STOP_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"RELEASE_DATE"	TIMESTAMP		NOT NULL
);

COMMENT ON COLUMN "BANNED"."STOP_NO" IS '제재 번호';

COMMENT ON COLUMN "BANNED"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "BANNED"."STOP_REASON" IS '정지 사유';

COMMENT ON COLUMN "BANNED"."STOP_DATE" IS '정지일';

COMMENT ON COLUMN "BANNED"."RELEASE_DATE" IS '정지 해제일';

CREATE TABLE "USER_ACCOUNT" (
	"USE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TARGET_NO"	NUMBER		NOT NULL,
	"PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"USE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "USER_ACCOUNT"."USE_NO" IS '내역 번호';

COMMENT ON COLUMN "USER_ACCOUNT"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "USER_ACCOUNT"."TARGET_NO" IS '대상 번호';

COMMENT ON COLUMN "USER_ACCOUNT"."PRICE" IS '변동 금액';

COMMENT ON COLUMN "USER_ACCOUNT"."USE_DATE" IS '이용일';

CREATE TABLE "CHAT_CONTENT" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"ROOM_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"READ_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"WRITE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "CHAT_CONTENT"."CHAT_NO" IS '채팅 내역 번호';

COMMENT ON COLUMN "CHAT_CONTENT"."ROOM_NO" IS '채팅방 번호';

COMMENT ON COLUMN "CHAT_CONTENT"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "CHAT_CONTENT"."CONTENT" IS '내용';

COMMENT ON COLUMN "CHAT_CONTENT"."READ_YN" IS '읽기 여부';

COMMENT ON COLUMN "CHAT_CONTENT"."WRITE_DATE" IS '작성시간';

CREATE TABLE "QUALITY" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"GRADE"	NUMBER	DEFAULT 0	NOT NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"CHECK_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "QUALITY"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "QUALITY"."GRADE" IS '상품 등급';

COMMENT ON COLUMN "QUALITY"."QUIT_YN" IS '삭제 여부';

COMMENT ON COLUMN "QUALITY"."CHECK_DATE" IS '검증일';

CREATE TABLE "BID" (
	"BID_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL,
	"PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"BID_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "BID"."BID_NO" IS '입찰 번호';

COMMENT ON COLUMN "BID"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "BID"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "BID"."PRICE" IS '입찰가';

COMMENT ON COLUMN "BID"."QUIT_YN" IS '취소 여부';

COMMENT ON COLUMN "BID"."BID_DATE" IS '입찰 시간';

CREATE TABLE "K_ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ID"	VARCHAR2(20)		NOT NULL,
	"PWD"	VARCHAR2(20)		NOT NULL,
	"NICK"	VARCHAR2(20)		NOT NULL,
	"KEY"	VARCHAR2(20)		NOT NULL,
	"BALANCE"	NUMBER	DEFAULT 0	NOT NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SIGN_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "K_ADMIN"."ADMIN_NO" IS '관리자 번호';

COMMENT ON COLUMN "K_ADMIN"."ID" IS 'ID';

COMMENT ON COLUMN "K_ADMIN"."PWD" IS 'PWD';

COMMENT ON COLUMN "K_ADMIN"."NICK" IS 'PWD';

COMMENT ON COLUMN "K_ADMIN"."KEY" IS '세션키';

COMMENT ON COLUMN "K_ADMIN"."BALANCE" IS '잔액';

COMMENT ON COLUMN "K_ADMIN"."QUIT_YN" IS '탈퇴 여부';

COMMENT ON COLUMN "K_ADMIN"."SIGN_DATE" IS '가입일';

CREATE TABLE "ADMIN_ACCOUNT" (
	"USE_NO"	NUMBER		NOT NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"USE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "ADMIN_ACCOUNT"."USE_NO" IS '내역 번호';

COMMENT ON COLUMN "ADMIN_ACCOUNT"."ADMIN_NO" IS '관리자 번호';

COMMENT ON COLUMN "ADMIN_ACCOUNT"."USER_NO" IS '대상 번호';

COMMENT ON COLUMN "ADMIN_ACCOUNT"."PRICE" IS '변동 금액';

COMMENT ON COLUMN "ADMIN_ACCOUNT"."USE_DATE" IS '이용일';

CREATE TABLE "CHAT_ROOM" (
	"ROOM_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CREATE_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_NO" IS '채팅방 번호';

COMMENT ON COLUMN "CHAT_ROOM"."ITEM_NO" IS '상품 번호';

COMMENT ON COLUMN "CHAT_ROOM"."USER_NO" IS '유저 번호';

COMMENT ON COLUMN "CHAT_ROOM"."CREATE_DATE" IS '생성 일자';

ALTER TABLE "K_USER" ADD CONSTRAINT "PK_K_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"QUESTION_NO"
);

ALTER TABLE "LIKELIST" ADD CONSTRAINT "PK_LIKELIST" PRIMARY KEY (
	"ITEM_NO",
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "ITEM" ADD CONSTRAINT "PK_ITEM" PRIMARY KEY (
	"ITEM_NO"
);

ALTER TABLE "ITEM_TYPE" ADD CONSTRAINT "PK_ITEM_TYPE" PRIMARY KEY (
	"TYPE_NO"
);

ALTER TABLE "HINT_TYPE" ADD CONSTRAINT "PK_HINT_TYPE" PRIMARY KEY (
	"QUESTION_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"PUBLIC_NO"
);

ALTER TABLE "AUCTION" ADD CONSTRAINT "PK_AUCTION" PRIMARY KEY (
	"ITEM_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"QUESTION_NO"
);

ALTER TABLE "BANNED" ADD CONSTRAINT "PK_BANNED" PRIMARY KEY (
	"STOP_NO"
);

ALTER TABLE "USER_ACCOUNT" ADD CONSTRAINT "PK_USER_ACCOUNT" PRIMARY KEY (
	"USE_NO"
);

ALTER TABLE "CHAT_CONTENT" ADD CONSTRAINT "PK_CHAT_CONTENT" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "QUALITY" ADD CONSTRAINT "PK_QUALITY" PRIMARY KEY (
	"ITEM_NO"
);

ALTER TABLE "BID" ADD CONSTRAINT "PK_BID" PRIMARY KEY (
	"BID_NO"
);

ALTER TABLE "K_ADMIN" ADD CONSTRAINT "PK_K_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "ADMIN_ACCOUNT" ADD CONSTRAINT "PK_ADMIN_ACCOUNT" PRIMARY KEY (
	"USE_NO"
);

ALTER TABLE "CHAT_ROOM" ADD CONSTRAINT "PK_CHAT_ROOM" PRIMARY KEY (
	"ROOM_NO"
);

ALTER TABLE "LIKELIST" ADD CONSTRAINT "FK_ITEM_TO_LIKELIST_1" FOREIGN KEY (
	"ITEM_NO"
)
REFERENCES "ITEM" (
	"ITEM_NO"
);

ALTER TABLE "LIKELIST" ADD CONSTRAINT "FK_K_USER_TO_LIKELIST_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "K_USER" (
	"USER_NO"
);

ALTER TABLE "AUCTION" ADD CONSTRAINT "FK_ITEM_TO_AUCTION_1" FOREIGN KEY (
	"ITEM_NO"
)
REFERENCES "ITEM" (
	"ITEM_NO"
);

ALTER TABLE "QUALITY" ADD CONSTRAINT "FK_ITEM_TO_QUALITY_1" FOREIGN KEY (
	"ITEM_NO"
)
REFERENCES "ITEM" (
	"ITEM_NO"
);



-- 더미데이터
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (1, 'USER01', '1111', 'NICK01', '010-1111-1111', '주소1', 10000, 1, '답변1','N' ,SYSDATE - 1);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (2, 'USER02', '2222', 'NICK02', '010-2222-2222', '주소2', 20000, 1, '답변2','S' ,SYSDATE - 2);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (3, 'USER03', '3333', 'NICK03', '010-3333-3333', '주소3', 30000, 1, '답변3','S' ,SYSDATE - 3);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (4, 'USER04', '4444', 'NICK04', '010-4444-4444', '주소4', 40000, 1, '답변4','N' ,SYSDATE - 4);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (5, 'USER05', '5555', 'NICK05', '010-5555-5555', '주소5', 50000, 1, '답변5','N' ,SYSDATE - 5);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (6, 'USER06', '6666', 'NICK06', '010-6666-6666', '주소6', 60000, 1, '답변6','N' ,SYSDATE - 6);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (7, 'USER07', '7777', 'NICK07', '010-7777-7777', '주소7', 70000, 1, '답변7','S' ,SYSDATE - 7);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (8, 'USER08', '8888', 'NICK08', '010-8888-8888', '주소8', 80000, 1, '답변8','N' ,SYSDATE - 8);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (9, 'USER09', '9999', 'NICK09', '010-9999-9999', '주소9', 90000, 1, '답변9','Q' ,SYSDATE - 9);
insert into K_USER (USER_NO, ID, PWD, NICK, PHONE_NO, ADDRESS, BALANCE, QUESTION_NO, ANSWER,USER_STATUS, SIGN_DATE) values (10, 'USER10', '0000', 'NICK10', '010-0000-0000', '주소10', 100000, 1, '답변10','Q', SYSDATE - 10);

insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (1, 1, '물건을 판매 구매하면 수수료가 있나요!?', '네', SYSDATE - 1);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (2, 2, '사기신고는 어디서 하나요?', '경찰서에서 하세요.', SYSDATE - 2);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (3, 3, '다른사람의 정보(전화번호 등)를 알고싶어요~', '일반적인 경우, 개인정보 보호법에 의해 개인의 정보는 제 3자에게 제공이 불가합니다.', SYSDATE - 3);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (4, 4, '도용을 당한것 같아요!!', '계정 도용으로 인한 피해 발생시 수사기관에 신고 접수 해주세요', SYSDATE - 4);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (5, 5, '판매 잘하는 방법이 궁금해요..', '1.사진 잘찍기 2. 시세 맞는 가격 제시하기 3. 설명 자세하기 적기', SYSDATE - 5);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (6, 6, '가격이 너무 비싼거같아요!', '중고거래인 만큼 KH마켓은 판매자가 자유롭게 가격을 책정하도록 하고 있어요. KH마켓에서 개입하여 판매 가격을 조정하지 않아요.', SYSDATE - 6);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (7, 7, '종량제 봉투를 개인이 판매할수 있나요?!', '종량제봉투를 개인이 판매할 경우 [폐기물관리법] 제14조7항의 규정에 따라 300만 원 이하의 벌금에 처할 수 있어요.', SYSDATE - 7);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, ANSWER, WRITE_DATE) values (8, 8, '직접 재배하거나 채취한 농수산물도 중고거래할 수 있나요?!', '네 할수있습니다.', SYSDATE - 8);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, WRITE_DATE) values (9, 9, '주류도 개인이 판매 할수 있나요?', SYSDATE - 9);
insert into QNA (QUESTION_NO, USER_NO, QUESTION, WRITE_DATE) values (10, 10, '"별로예요" 거래 후기를 남기면 상대방이 알 수 있나요?', SYSDATE - 10);

insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (1, 1, 1, SYSDATE - 1);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (2, 2, 2, SYSDATE - 2);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (3, 3, 3, SYSDATE - 3);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (4, 4, 4, SYSDATE - 4);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (5, 5, 5, SYSDATE - 5);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (6, 6, 6, SYSDATE - 6);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (7, 7, 7, SYSDATE - 7);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (8, 8, 8, SYSDATE - 8);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (9, 9, 9, SYSDATE - 9);
insert into REVIEW (REVIEW_NO, USER_NO, ITEM_NO, TRADE_DATE) values (10, 10, 10, SYSDATE - 10);

insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (1, 1, 1, '플로어 스탠드', '사용한지 일주일밖에 안됬어요', 10000,'S' ,SYSDATE - 1);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (2, 2, 2, '축구화', '저랑 사이즈가 안맞아서 팝니다', 20000,'S' ,SYSDATE - 2);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (3, 3, 3, '40000원 CU기프티콘', '쓸일이 없어서 팔아요~', 30000,'A' ,SYSDATE - 3);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (4, 4, 4, '무쇠냄비', '이사가는데 무거워서 처리합니다..', 40000,'S' ,SYSDATE - 4);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (5, 5, 5, '쿠쿠밥솥', '딱 2번사용한 제품이에요', 50000,'S' ,SYSDATE - 5);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (6, 6, 6, 'LG27인치 모니터 팔아요', 'LG27MP37VQ IPS화면으로 선명하고 깨끗합니다', 60000,'A' ,SYSDATE - 6);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (7, 7, 7, '에어팟 진검승부 하실분', '본체를 잃어버려서 양쪽 유닛만 남은상태고 본체 있으신분 찾아요.', 70000,'S' ,SYSDATE - 7);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (8, 8, 8, '제 위에분  ', '저는 오른쪽만 잃어버려서 왼쪽만 남은 상태입니다. 가위바위보 3세판으로 결판내죠', 80000,'B' ,SYSDATE - 8);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (9, 9, 9, '마스크 팔아요', '300장 입니다.', 90000,'D' ,SYSDATE - 9);
insert into ITEM (ITEM_NO, TYPE_NO, USER_NO, TITLE, CONTENT, PRICE,TRADE_STATUS, WRITE_DATE) values (10, 10, 10, '일룸 4인용 식탁 판매합니다', '상판에 약간얼룩외에 상태 좋아요~', 100000,'B' ,SYSDATE - 10);

insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (1, '분류1');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (2, '분류2');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (3, '분류3');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (4, '분류4');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (5, '분류5');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (6, '분류6');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (7, '분류7');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (8, '분류8');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (9, '분류9');
insert into ITEM_TYPE (TYPE_NO, TYPE_NAME) values (10, '분류10');

insert into HINT_TYPE (QUESTION_NO, QUESTION) values (1, '내가 졸업한 고등학교는?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (2, '내가 졸업한 대학교이름은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (3, '내가 졸업한 초등학교이름은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (4, '내가 졸업한 중학교이름은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (5, '내가 다니던 유치원이름은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (6, '내가 가장 좋아하는 음식은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (7, '내가 가장 좋아하는 노래 제목은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (8, '내가 가장 좋아하는 사람은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (9, '내가 가장 좋아하는 운동은?');
insert into HINT_TYPE (QUESTION_NO, QUESTION) values (10, '내가 가장 싫어하는 음식은?');

insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (1, '이번달 인기 상품', '이번달 인기상품들입니다~~', SYSDATE - 1);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (2, '첫 결제 수수료 무료!!', '처음 이용하시면 수수료 무료~', SYSDATE - 2);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (3, '편의점 픽업 이용시 수수료 무료!!', '편의점 픽업 하시면 수수료 무료에요', SYSDATE - 3);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (4, '2월 거래 해택 모음', '2월에 거래하면 포인트1000포인트 지급', SYSDATE - 4);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (5, '카카오 페이로 결제시 2만원 적립!', '카카오페이로 결제하면 2만원 적립해드립니다', SYSDATE - 5);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (6, '22년 연말 결산', '22년 KH마켓은 어땠을까?', SYSDATE - 6);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (7, '영상보고 에어팟 받자~', '영상들 보세요~', SYSDATE - 7);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (8, '네이버 페이 결제 해택', '네이버 페이 결제시 3000포인트 적립', SYSDATE - 8);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (9, 'KH마켓 서버 변경 안내', '긴급 서버 변경하였습니다 어떠한 오류가 발생할지 예상할수 없습니다.', SYSDATE - 9);
insert into NOTICE (PUBLIC_NO, TITLE, CONTENT, WRITE_DATE) values (10, '모바일 "판매 완료" 버튼 오류 수정', '모바일에서 판매완료 버튼기능이 정상작동 하지 않는 점이 발견되어정상 수정하였습니다.', SYSDATE - 10);

insert into AUCTION (ITEM_NO, END_TIME) values (1, SYSDATE + 0.1);
insert into AUCTION (ITEM_NO, END_TIME) values (2, SYSDATE + 0.2);
insert into AUCTION (ITEM_NO, END_TIME) values (3, SYSDATE + 3);
insert into AUCTION (ITEM_NO, END_TIME) values (4, SYSDATE + 4);
insert into AUCTION (ITEM_NO, END_TIME) values (5, SYSDATE + 5);
insert into AUCTION (ITEM_NO, END_TIME) values (6, SYSDATE + 6);
insert into AUCTION (ITEM_NO, END_TIME) values (7, SYSDATE + 7);
insert into AUCTION (ITEM_NO, END_TIME) values (8, SYSDATE + 8);
insert into AUCTION (ITEM_NO, END_TIME) values (9, SYSDATE + 9);
insert into AUCTION (ITEM_NO, END_TIME) values (10, SYSDATE + 10);

insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (1, '판매자 연락처 확인하는 방법', '판매글 본문 우측 상단에 판매자의 연락처 항목이 있습니다.');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (2, '포인트 획득은 어떻게 할수 있나요?', '신규 가입시 10점, 로그인시1점 , 댓글 작성시 2점');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (3, '선입금 해도 괜찮나요..?', '일단 선입금은 구매자분의 선택입니다. 하지만 절대 추천하지않습니다.');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (4, '판매 금지 물품들이 궁금해요', '1)반려동물, 생명이있는 동물 곤충  2)총 3)경유,LPG, 휘발류 등 유류 거래');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (5, '사기를 당했을때는 어떻게 하나요', '1. 경찰서에 신고하기 2.KH마켓이 도와드릴게요');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (6, '거래 분쟁 어떻게 예방할수있나요?', '1. 거래장소는 사람이 많이다니는곳에서 하세요 2.경찰서 파출소 앞에서 하세요');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (7, 'KH마켓은 어떤 서비스 인가요?', '중고물품 거래 서비스 입니다');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (8, '신고하면 상대방이 알수 있나요?', '신고는 익명으로 진행되고있으니 안심하고 신고 해주세요');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (9, '미성년자도 KH마켓을 이용할수 있나요?', 'KH마켓은 만 14세 이상 휴대폰 사용자라면 이용할 수 있으며 가입 과정에서 [만 14세 이상 (필수)] 항목에 대해 동의받고 있어요.');
insert into FAQ (QUESTION_NO, QUESTION, ANSWER) values (10, '이용 정지된 사용자와 거래해도 괜찮나요?', '저희는 이용 정지된 회원은 로그인 할수 없으므로 거래가 불가능합니다.');

insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (1, 1, SYSDATE + 1);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (2, 2, SYSDATE + 2);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (3, 3, SYSDATE + 3);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (4, 4, SYSDATE + 4);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (5, 5, SYSDATE + 5);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (6, 6, SYSDATE + 6);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (7, 7, SYSDATE + 7);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (8, 8, SYSDATE + 8);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (9, 9, SYSDATE + 9);
insert into BANNED (STOP_NO, USER_NO, RELEASE_DATE) values (10, 10, SYSDATE + 10);

insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (1, 1, 1, 10000, SYSDATE - 1);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (2, 2, 2, 20000, SYSDATE - 2);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (3, 3, 3, 30000, SYSDATE - 3);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (4, 4, 4, 40000, SYSDATE - 4);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (5, 5, 5, 50000, SYSDATE - 5);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (6, 6, 6, 60000, SYSDATE - 6);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (7, 7, 7, 70000, SYSDATE - 7);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (8, 8, 8, 80000, SYSDATE - 8);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (9, 9, 9, 90000, SYSDATE - 9);
insert into USER_ACCOUNT (USE_NO, USER_NO, TARGET_NO, PRICE, USE_DATE) values (10, 10, 10, 100000, SYSDATE - 10);

insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (1, 1, 1, '내용1', SYSDATE - 1);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (2, 2, 2, '내용2', SYSDATE - 2);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (3, 3, 3, '내용3', SYSDATE - 3);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (4, 4, 4, '내용4', SYSDATE - 4);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (5, 5, 5, '내용5', SYSDATE - 5);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (6, 6, 6, '내용6', SYSDATE - 6);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (7, 7, 7, '내용7', SYSDATE - 7);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (8, 8, 8, '내용8', SYSDATE - 8);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (9, 9, 9, '내용9', SYSDATE - 9);
insert into CHAT_CONTENT (CHAT_NO, ROOM_NO, USER_NO, CONTENT, WRITE_DATE) values (10, 10, 10, '내용10', SYSDATE - 10);

insert into QUALITY (ITEM_NO, CHECK_DATE) values (1, SYSDATE - 1);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (2, SYSDATE - 2);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (3, SYSDATE - 3);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (4, SYSDATE - 4);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (5, SYSDATE - 5);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (6, SYSDATE - 6);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (7, SYSDATE - 7);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (8, SYSDATE - 8);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (9, SYSDATE - 9);
insert into QUALITY (ITEM_NO, CHECK_DATE) values (10, SYSDATE - 10);


insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN ,BID_DATE) values (1, 1, 1, 10000,'N' ,SYSDATE - 1);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (2, 2, 2, 20000,'N' ,SYSDATE - 2);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (3, 3, 3, 30000,'D',SYSDATE - 3);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (4, 4, 4, 40000,'N' ,SYSDATE - 4);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (5, 5, 5, 50000,'N' ,SYSDATE - 5);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (6, 6, 6, 60000,'D',SYSDATE - 6);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (7, 7, 7, 70000,'N' ,SYSDATE - 7);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (8, 8, 8, 80000,'N' ,SYSDATE - 8);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (9, 9, 9, 90000,'N' ,SYSDATE - 9);
insert into BID (BID_NO, USER_NO, ITEM_NO, PRICE,QUIT_YN, BID_DATE) values (10, 10, 10, 100000,'N' ,SYSDATE - 10);

insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (1, 'ADMIN01', '1111', 'NICK01', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (2, 'ADMIN02', '2222', 'NICK02', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (3, 'ADMIN03', '3333', 'NICK03', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (4, 'ADMIN04', '4444', 'NICK04', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (5, 'ADMIN05', '5555', 'NICK05', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (6, 'ADMIN06', '6666', 'NICK06', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (7, 'ADMIN07', '7777', 'NICK07', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (8, 'ADMIN08', '8888', 'NICK08', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (9, 'ADMIN09', '9999', 'NICK09', 'ABCD');
insert into K_ADMIN (ADMIN_NO, ID, PWD, NICK, KEY) values (10,'ADMIN10', '0000', 'NICK10', 'ABCD');

insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (1, 1, 1, 10000, SYSDATE - 1);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (2, 2, 2, 20000, SYSDATE - 2);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (3, 3, 3, 30000, SYSDATE - 3);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (4, 4, 4, 40000, SYSDATE - 4);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (5, 5, 5, 50000, SYSDATE - 5);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (6, 6, 6, 60000, SYSDATE - 6);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (7, 7, 7, 70000, SYSDATE - 7);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (8, 8, 8, 80000, SYSDATE - 8);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (9, 9, 9, 90000, SYSDATE - 9);
insert into ADMIN_ACCOUNT (USE_NO, ADMIN_NO, USER_NO, PRICE, USE_DATE) values (10, 10, 10, 100000, SYSDATE - 10);

insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (1, 1, 1, SYSDATE - 1);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (2, 2, 2, SYSDATE - 2);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (3, 3, 3, SYSDATE - 3);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (4, 4, 4, SYSDATE - 4);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (5, 5, 5, SYSDATE - 5);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (6, 6, 6, SYSDATE - 6);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (7, 7, 7, SYSDATE - 7);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (8, 8, 8, SYSDATE - 8);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (9, 9, 9, SYSDATE - 9);
insert into CHAT_ROOM (ROOM_NO, ITEM_NO, USER_NO, CREATE_DATE) values (10, 10, 10, SYSDATE - 10);

insert into LIKELIST (ITEM_NO, USER_NO) values (1, 1);
insert into LIKELIST (ITEM_NO, USER_NO) values (2, 2);
insert into LIKELIST (ITEM_NO, USER_NO) values (3, 3);
insert into LIKELIST (ITEM_NO, USER_NO) values (4, 4);
insert into LIKELIST (ITEM_NO, USER_NO) values (5, 5);
insert into LIKELIST (ITEM_NO, USER_NO) values (6, 6);
insert into LIKELIST (ITEM_NO, USER_NO) values (7, 7);
insert into LIKELIST (ITEM_NO, USER_NO) values (8, 8);
insert into LIKELIST (ITEM_NO, USER_NO) values (9, 9);
insert into LIKELIST (ITEM_NO, USER_NO) values (10, 10);