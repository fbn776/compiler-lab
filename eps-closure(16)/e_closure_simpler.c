#include <stdio.h>
#include <string.h>

#define MAX 20

int n; // number of states
int eclosure[MAX][MAX]; // epsilon closure table
int visited[MAX]; // visited states for DFS
int adj[MAX][MAX]; // adjacency matrix for epsilon transitions

void dfs(int state) {
    for (int i = 0; i < n; i++) {
        if (adj[state][i] && !visited[i]) {
            visited[i] = 1;
            dfs(i);
        }
    }
}

int main() {
    int t;
    printf("Enter number of states: ");
    scanf("%d", &n);

    memset(adj, 0, sizeof(adj));

    printf("Enter number of transitions: ");
    scanf("%d", &t);

    printf("Enter transitions in format q1aq2 where a is input symbol (# for epsilon):\n");
    for (int i = 0; i < t; i++) {
        char q1[5], q2[5], sym;
        scanf("%s %c %s", q1, &sym, q2);
        int from = q1[1] - '0';
        int to = q2[1] - '0';

        if (sym == '#') {
            adj[from][to] = 1;
        }
    }

    printf("\nEpsilon Closures:\n");
    for (int i = 0; i < n; i++) {
        memset(visited, 0, sizeof(visited));
        visited[i] = 1;
        dfs(i);

        printf("ε-closure(q%d) = { ", i);
        for (int j = 0; j < n; j++) {
            if (visited[j]) {
                printf("q%d ", j);
            }
        }
        printf("}\n");
    }

    return 0;
}
