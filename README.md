# 📦 Inception
Inception은 Docker/Docker Compose를 사용해 NGINX, WordPress, MariaDB로 구성된 웹 서비스를 설정하는 프로젝트입니다. 이 프로젝트는 **42 서울 커리큘럼**의 일환으로, 컨테이너에 대한 이해와 컨테이너 오케스트레이션을 구성하는 방식을 학습하는 것을 목표로 합니다.

## 🎯 프로젝트 목표
- NGINX 컨테이너 구성.
- WordPress 컨테이너 구성.
- MariaDB 컨테이너 구성.
- Docker Compose로 컨테이너 오케스트레이션 구성
(**모든 컨테이너는 Docker Image를 Pull 해선 안됨**)

## ✨ 주요 기능
- TLS/SSL 기능이 적용된 NGINX가 실행됩니다.
- `.env` 파일의 내용을 바탕으로 MariaDB와 WordPress가 자동적으로 설정하고 실행됩니다.
- Docker Compose 명령어으로 작성한 MakeFile을 통해 빌드/실행/삭제를 수행합니다.

## 🚀 Getting Stared
### 시스템 요구 사항
Docker가 설치되어 있는 어느 OS에서든 실행 가능합니다.

### 설치 및 실행
1. 저장소 클론
```bash
git clone 
```

2. 빌드(이미지 생성)
```bash
make build
```

3. 실행
- 모든 서비스를 빌드하고 실행
```bash
make up
```
- 빌드된 이미지가 있는 경우 서비스를 시작
```bash
make start
```

4. 접속
- `https://localhost` 혹은 `.env` 파일에 설정된 `WP_URL` 로 접속하면 WordPress 사이트를 확인할 수 있습니다.

5. 서비스 종료 및 이미지 제거
```bash
make down
```

6. 데이터 영구 삭제
```bash
make clean
```
(**주의 : 호스트 머신에 저장된 모든 데이터를 삭제합니다.**)

