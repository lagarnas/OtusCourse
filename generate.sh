MODULE="Modules/NewsApiNetwork/Sources/NewsApiNetwork/"
openapi-generator generate -i "newsapi.yaml" -g swift5 -o "newsapi"
rm -r $MODULE""*
cp -R "newsapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "newsapi"
