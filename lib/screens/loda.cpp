#include <bits/stdc++.h>

using namespace std;


/*
 * Complete the 'minimumSwaps' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING brackets as parameter.
 */

int minimumSwaps(string s) {
int extra=0;
int maxElem=INT_MIN;
for(auto x : s){
    if(x== ')'){
        extra++;
    }
    
    else{
        extra--;
    }
    maxElem=max(maxElem,extra);
    int re=(maxElem+1)/2;
    if(extra>0) return -1;
    else return re;
}}

int main()
{
    ofstream fout(getenv("OUTPUT_PATH"));

    string brackets;
    getline(cin, brackets);

    int result = minimumSwaps(brackets);

    fout << result << "\n";

    fout.close();

    return 0;
}
