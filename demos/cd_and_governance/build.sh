docker build --rm -t "governance_demo/dtgov" dtgov
docker build --rm -t "governance_demo/sy" sy

docker tag governance_demo/sy governance_demo/sy:1.0.0
docker tag governance_demo/dtgov governance_demo/dtgov:1.0.0
