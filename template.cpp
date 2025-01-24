#include <bits/stdc++.h>

using namespace std;

void solve() {
  int n = 10;
  
  vector<int> hi(n);
  for (auto &i : hi)
    i = pow(rand(), rand() % 3);
  sort(hi.begin(), hi.end());
  for(auto i : hi) cout << i << " ";

  
}

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  int t;
  cin >> t;
  while (t--)
    solve();
}
