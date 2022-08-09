## MonkeyStock

## 프로젝트 동기

- DDD(Domain Driven Development)기반 개발을 진행했습니다.
- 팀원 각자 다른 언어로 기능을 만들어 하나의 솔루션을 제공하는 MSA아키텍쳐 형태로 만들어 진행했습니다.

### 팀원 구성

- 주식 트레이딩 기능 개발 1명
- 주식 커뮤니티 기능 개발 1명
- 챗봇 기능 개발 1명 (본인)

## 기술스택

- nodeJs(express) - 챗봇 백엔드 구현
- mongoDB Atlas - DB로 사용
- Docker, kubernetes, EKS
- [jenkins(CI)](https://www.notion.so/Jenkins-nodeJS-CI-40b26d37beb74d6b8e84c6bbb6a72b8c) ArgoCD(CD) - Test, Lint, Image, Deployment를 자동화 시키기 위해 사용
- Jira, Mirimba

## DDD(eventStroming)

- 이벤트 스토밍을 활용한 도메인 도출.(mirimba)


### 아키텍쳐 구조

- express와 springboot를 각각 백엔드 언어로 사용했습니다.
    - 폴리글랏 아키텍쳐로써 각 서비스에 맞는 언어를 사용해서 장점으로 적용 되었습니다.
    - 단점은 시스템이 복잡해짐에 디버깅과 테스트가 어렵다는 점이 있었습니다.

### 클라우드 아키텍쳐 구조


- AWS 네트워크를 구성하였습니다.
- public-subnet 에서는 Jenkins와 EKS에 접근할 수 있는 Bastion을 두고 관리 했습니다.
- ArgoCD를 활용해서 쿠버네티스 환경으로 서비스를 관리했습니다.

### GitOps PipeLine(CI/CD)


- Jenkins에서 빌드 이미지를 도커에 푸시 한후 GitOps레포에 접근해서 해당 이미지의 버전으로 업데이트 시켜줍니다.
- ArgoCD는 해당 깃 옵스레포의 script대로 서비스를 배포합니다.
