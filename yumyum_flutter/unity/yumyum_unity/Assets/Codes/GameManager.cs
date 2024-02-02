using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class GameManager : MonoBehaviour
{
    public GameObject[] enemies;
    public int stage = 0;
    public bool isEnemyExist = false;
    public int gold = 0;

    public TextMeshProUGUI stageText;
    public TextMeshProUGUI goldText;
    // Start is called before the first frame update
    void Start()
    {
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
        StartCoroutine(SpawnEnemyAfterDelay(1f));
    }
    public void GetGold(int g) {
        gold += g;
    }
    IEnumerator SpawnEnemyAfterDelay(float delay)
    {
        stage += 1;
        yield return new WaitForSeconds(delay);

        Instantiate(enemies[0], transform.position, Quaternion.identity);
        isEnemyExist = true;
    }
}
