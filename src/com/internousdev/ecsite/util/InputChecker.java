package com.internousdev.ecsite.util;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils
;
public class InputChecker {

	/**
	 * このプログラムは渡された値を正規表現か検証するものです。
	 * 使い方はdoCheckに9つの引数を渡します。後半部分には当てはまる形式にtrueを入れます。
	 * emailを判別したいのであれば英字、数字、記号を含むため下記のようになります。
	 * 例(質問の内容,値,最小文字数,最大文字数,true,false,false,true,true)となります。
	 * 結果はList形式で渡されることに気を付けてください。
	 *
	 */
	public List<String> doCheck(String propertyName,String value){

		//検証した結果を入れるList
				List<String> stringList = new ArrayList<String>();
				List<String> characterTypeList = new ArrayList<String>();

				//入力欄が空かどうかを検証します
				if(StringUtils.isEmpty(value)){
					stringList.add(propertyName + "を入力してください。");
				}

				///////////入力された文字のタイプから何を判別するか決めます//////////
				String regularExpression = "[^";
				String errorExpression = "[^";

					regularExpression +="0-9";
					regularExpression +="]+";
					characterTypeList.add("半角数字");

					errorExpression +="@.,;:!#$%&'*+-/=?^_`{|}~";
					errorExpression +="ァ-ヺ";
					errorExpression +="＠．，；：！＃＄％＆’＊＋―／＝？＾＿｀｛｜｝～";
					errorExpression += "a-zA-Z";
					errorExpression +="一-龯";
					errorExpression +="ぁ-ん";
					errorExpression +="]+";


				////////////////////////////ここまで///////////////////////////


				//判別した項目に応じてエラーメッセージを返します
				String characterType = "";
				for(int i = 0;i < characterTypeList.size();i++){
					if(i == 0){
						characterType += characterTypeList.get(i).toString();
					}else{
						characterType += "、" + characterTypeList.get(i).toString();
					}
				}

				if(value.matches(regularExpression)||(!value.matches(errorExpression)&&!value.equals(""))){
					stringList.add(propertyName + "は" + characterType + "で入力してください。");
				}

				return stringList;
			}


	//一度目のパスワードと二度目のパスワードが同じかを検証します。
	public List<String> doPasswordCheck(String password,String reConfirmationPassword){
		List<String> stringList = new ArrayList<String>();
		if(!(password.equals(reConfirmationPassword))){
			stringList.add("入力されたパスワードが異なります。");
		}
		return stringList;
	}
}
