using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class GameManager : MonoBehaviour
{
    public GameObject[] enemies;
    static public int stage = 0;
    public bool isEnemyExist = false;
    static public int gold = 0;

    public TextMeshProUGUI stageText;
    public TextMeshProUGUI goldText;

 
    // Start is called before the first frame update
    void Start()
    {
        stage = 0;
        gold = 0;
        StartCoroutine(SpawnEnemyAfterDelay(0));
    }

    // Update is called once per frame
    void Update()
    {
        //ui update
        stageText.text = stage.ToString();
        goldText.text = gold.ToString();
    }
    public void SpawnEnemy() {
        if (isEnemyExist) {
            return;
        }
        StartCoroutine(SpawnEnemyAfterDelay(1f));
    }
    public void GetGold(int g) {
        gold += g;
    }
    IEnumerator SpawnEnemyAfterDelay(float delay)
    {
        stage += 1;
        yield return new WaitForSeconds(delay);
        int index = Random.Range(0, enemies.Length);
        Instantiate(enemies[index], transform.position, Quaternion.identity);
        isEnemyExist = true;
    }
}
