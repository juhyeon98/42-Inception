# 📦 Inception

Inception은 Docker/Docker Compose를 사용하여 NGINX, WordPress, MariaDB로 구성된 독립적인 웹 서비스 환경을 구축하는 시스템 관리 프로젝트입니다.
이 프로젝트는 **42 Seoul 커리큘럼**의 일환으로, 시스템 가상화, 컨테이너 오케스트레이션, 그리고 네트워크 구성을 깊이 있게 이해하는 것을 목표로 합니다.

## 🎯 프로젝트 목표 (Goals)
- **Docker Image Pull 금지**: 모든 서비스는 Dockerfile을 통해 Alpine Linux 기반으로 직접 빌드합니다.
- **서비스 구성**:
  - **NGINX**: TLS/SSL.
  - **WordPress**: PHP-FPM을 통해 동작하는 CMS.
  - **MariaDB**: WordPress 데이터를 저장하는 데이터베이스.
- **Docker Compose**: 독립된 컨테이너 간의 네트워크 연결 및 볼륨 관리.

## ✨ 주요 기능 (Features)
- **보안 연결**: Openssl을 이용한 Self-signed 인증서 발급 및 HTTPS 접속 지원.
- **자동화된 설정**: `.env` 환경 변수를 통해 DB 및 WordPress 초기 설정 자동화.
- **데이터 영속성**: Docker Volume을 사용하여 컨테이너가 삭제되어도 데이터 유지.
- **편리한 제어**: `Makefile`을 통한 통합 빌드 및 제어 시스템.

## 🚀 Getting Stared
### 시스템 요구 사항
- Docker Engine & Docker Compose
- GNU Make
- Virtual Machine (Debian/Ubuntu 권장)

### 설치 및 실행
1. 저장소 클론
```bash
git clone https://github.com/juhyeon98/42-Inception.git
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
- `https://juhyelee.42.fr` 혹은 `.env` 파일에 설정된 `WP_URL` 로 접속하면 WordPress 사이트를 확인할 수 있습니다.

5. 서비스 종료 및 이미지 제거
```bash
make down
```

6. 데이터 영구 삭제
```bash
make clean
```
(**주의 : 호스트 머신에 저장된 모든 데이터를 삭제합니다.**)

