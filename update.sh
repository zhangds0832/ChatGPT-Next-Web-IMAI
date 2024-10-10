# yarn build
tar -czvf dist.tar.gz -C out .
scp -P 27652 dist.tar.gz root@66.112.217.45:/var/www/ng-cf/html/ai-h5
ssh root@66.112.217.45 -p 27652 "cd  /var/www/ng-cf/html/ai-h5; tar -xzvf dist.tar.gz; rm dist.tar.gz; exit"
rm dist.tar.gz


# chatgpt
# 66.112.217.45 -p 27652

