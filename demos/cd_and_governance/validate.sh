docker run -i -t --rm --volumes-from="govdemo_sy_dev" --volumes-from="govdemo_sy_qa" --volumes-from="govdemo_sy_stage" --link govdemo_mail:mail --link govdemo_sy_dev:dev --link govdemo_sy_qa:qa --link govdemo_sy_stage:stage --name "govdemo_dtgov_validate"  governance_demo/dtgov /bin/bash
