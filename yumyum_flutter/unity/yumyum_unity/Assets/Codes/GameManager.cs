using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public GameObject[] enemies;
    public int stage = 0;
    public bool isEnemyExist = false;
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(SpawnEnemyAfterDelay(0));
    }

    // Update is called once per frame
    void Update()
    {

    }
    public void SpawnEnemy() {
        StartCoroutine(SpawnEnemyAfterDelay(1f));
    }
    IEnumerator SpawnEnemyAfterDelay(float delay)
    {
        stage += 1;
        yield return new WaitForSeconds(delay);

        Instantiate(enemies[0], transform.position, Quaternion.identity);
        isEnemyExist = true;
    }
}
