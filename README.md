# DQA 내부과제
-----------------------

## 01. 목적
  1. Github Action 및 Helm Chart에 대한 이해 향상
  2. Ingest 배포에 대한 구성 파악 및 Action 구성

----------------------
## 02. 과정
  1. Dockerfile 기반의 Image build
  2. Build 된 Image를 Google Artifact registry에 Upload
  3. 생성한 Image를 기반으로 Helm Chart 구성
  4. Helm Chart 기반의 GKE Cluster 배포

-----------------------
## 03. Resource
  - Google Cloud Platform (GCP)
    - Workload Identity Federation (WIF)
      > Github Action내의 GCP 인증
    - Google Artifact Registry (GAR)
      > Image 보관 및 관리
    - Google Kubernetes Engine (GKE)
      > Halm Chart 기반의 Service 배포

------------------------
## 04. Workflow 동작 구성
  1. nginx 디렉토리의 file을 'main' 브랜치로 push하면 Image 생성 작업이 시작
  2. Image 생성 Workflow를 기반으로 생성된 Image를 GAR에 Upload
  3. 배포할 Image Tag를 Input 값으로 기입 하면 GKE 배포가 진행 (workflow_dispatch)
  4. GKE 배포는 helm chart 기반으로 배포 (helm-nginx)

------------------------
## 05. Git Tree

 ```
📂.github/workflows
 ┗📜1-1.delivery-nginx.yml          : Image build Value
  📜1-2.delivery.yml                : Docker build & GAR push workflow
  📜2-1.deploy-nginx-gke.yml        : Upgrade the release into the GKE cluster 
  📜2-2.deploy-helm-gke.yml         : GKE deploy Value

📂helm-nginx                       : Nginx Helm Chart DIR
 ┗📂templates
   ┗📜.helmignore
    📜Chart.yaml
    📜values.yaml

📂nginx                            : Nginx Image Source
 ┗📜Dokerfile(nginx Doker File)     : Nginx Image Build 용 Dockerfile
  📜index.html(index File)          : Nginx 수정용 index.html

📜README.md
```
