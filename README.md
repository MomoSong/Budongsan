# Budongsan
20180717경영기술개발원 2차 프로젝트

**현재 원격 DB서버 포맷으로 메인페이지 및 기타 페이지가 작동하지 않습니다.
**이메일 인증도 동작하지 않습니다. (개인 이메일 사용으로 보안을 위해 꺼두었습니다.)

로그인, 회원가입, 메인페이지 제작 - 송근모

<br/>
<br/>

<img src="http://drive.google.com/uc?export=view&id=1h04pFsXyKI0wLW0PCWAHUsnmcvrlKnsd" />

<br/>
<br/>

** 카카오 로그인 링크는 작동하지 않습니다. (버튼만 달려있습니다.)
** 아이디와 비밀번호 입력창은 유효성 검사를 합니다. (아이디는 이메일 형식입니다.)

** 아이디 찾기는 개인정보가 일치하면 이메일 아이디를 알려줍니다.
** 비밀번호 찾기는 새로운 형식의 무작위 비밀번호를 제작하여 (임시비밀번호) 이메일로 전송해 줍니다.

<br/>
<br/>

<img src="http://drive.google.com/uc?export=view&id=1RZn3i8l-Vl7WJOpRywxj--XOo140UDKf" />


<br/>
<br/>

회원가입 페이지
** 아이디, 비밀번호, 전화번호 칸은 유효성 검사를 실행합니다.(javascript로 구현)
** 회원가입 완료시에 이메일 아이디로 인증코드가 발송됩니다.(javax mail로 구현)
** 회원 가입 완료된 비밀번호는 Spring security를 통해 암호화되어 저장됩니다. 

<br><br><br>
<코드 리뷰 - MemberController 에서 발췌>

<img src='http://drive.google.com/uc?export=view&id=1UkvIptIR9VUsZRxRiDwBdVQRllcDTXuT' /><br><br><br>

<img src='http://drive.google.com/uc?export=view&id=1hWtyw2I4RoUG6E5NnxzYpYTjPXXOGk7T' /><br><br><br>

<img src='http://drive.google.com/uc?export=view&id=1oli74355WitYdqiyd_5wf16AFun11JTT' /><br><br><br>

<img src='http://drive.google.com/uc?export=view&id=1eGSUNXGC3wy6g9hkJOd1dZoJ7Fq5F92B' /><br><br><br>

<img src='http://drive.google.com/uc?export=view&id=1PjEog2fA1Uh9y_x1S1TuZt3be7MSn-Ad' /><br><br><br>



